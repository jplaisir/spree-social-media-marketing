class << Spree.user_class
  include Spree::Core::Engine.routes.url_helpers
end

Spree.user_class.class_eval do

  Spree.user_class::MILESTONES = [1000, 2000, 5000]

  after_create :check_if_any_milestone_reached

  def self.advertise_milestone_on_facebook(milestone)
    caption = "Hurray. We have reached #{ milestone } users. Check out the store at #{ self.root_url(host: (Rails.application.config.action_mailer.default_url_options[:host] || 'localhost:3000')) }"
    Spree::Store.default.facebook_pages.each do |facebook_page|
      facebook_page.post_message(caption)
    end
  end

  def self.advertise_milestone_on_twitter(milestone)
    tweet = "Hurray. We have reached #{ milestone } users. Check out the store at #{ self.root_url(host: (Rails.application.config.action_mailer.default_url_options[:host] || 'localhost:3000')) }"
    Spree::Store.default.twitter_accounts.each do |twitter_account|
      twitter_account.post_tweet(tweet)
    end
  end

  private
    def check_if_any_milestone_reached
      customer_count = get_customer_count
      if customer_count.in?(Spree.user_class::MILESTONES)
        milestone_reached(customer_count)
      end
    end

    def milestone_reached(milestone)
      UserMilestoneMarketingJob.perform_later(milestone)
    end

    # This is placeholder method. Developers can override this to get the number of cutomers as per their app and roles.
    def get_customer_count
      Spree.user_class.count - Spree.user_class.admin.count
    end
end