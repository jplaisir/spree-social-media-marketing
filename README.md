SpreeSocialMediaMarketing
=========================
Spree Social Media Marketing helps making regular marketing tasks a breeze.

It helps you with managing your Facebook and Twitter Marketing Accounts.
You can post to Facebook and Twitter Accounts, right from the Spree Admin Console.
It helps you create few Marketing Events which will trigger automatic posts to active Social
Media Acconts.
- A product selling fast will trigger a low stock marketing event which
  will post a low stock message on social accounts.
- When you are receiving bumper orders, you can market that.
- A new payment method addition will trigger a post about its
  availability.
- A new product is available, gets posted automatically on your social
  accounts
- A new promotion can be immediately announced on social accounts
- You want to boast of 1000 users onboard, can be posted automatically
  on social accounts

You are more of a DIY type, use the manual posting for each social
account :)

## Pre-requisites

- You should have account on [Facebook Developers](https://developers.facebook.com)
  - Create an App
  - Create a Facebook Page in your account where you want to post
    updates
- You should have account on [Twitter Account](https://apps.twitter.com)
  - Create an App

## Installation

1. Add this extension to your Gemfile with this line:
  ```ruby
  gem 'spree_social_media_marketing', github: 'vinsol-spree-contrib/spree-social-media-marketing', branch: '3-1-stable'
  ```

  The `branch` option is important: it must match the version of Spree you're using.
  For example, use `3-1-stable` if you're using Spree `3-1-stable` or any `3.1.x` version.

2. Install the gem using Bundler:
  ```ruby
  bundle install
  ```

   - Add `gem 'koala'` with desired version in SpreeCommerce Store Rails App `Gemfile` to avoid undefined constant error :(

3. Copy & run migrations
  ```ruby
  bundle exec rails g spree_social_media_marketing:install
  ```

  You can also seed the default marketing events with:

  ```ruby
  bundle exec rails g spree_social_media_marketing:seed
  ```

4. Set Social Accounts API key credentials in Rails secrets (config/secrets.yml)

  - Facebook

    ```ruby
    # config/secrets.yml
    development:
      facebook_app_secret: 1234567
      facebook_app_key: abscdg

    test:
      facebook_app_secret: 1234567
      facebook_app_key: abscdg
    ```

  - Twitter

    ```ruby
    # config/secrets.yml
    development:
      twitter_consumer_key: 1234567
      twitter_consumer_secret: abscdg

    test:
      twitter_consumer_key: 1234567
      twitter_consumer_secret: abscdg
    ```

  - **NOTE** : Use the key names same as above :)

5. Restart your server

  If your server was running, restart it so that it can find the assets properly.


## Testing

First bundle your dependencies, then run `rake`. `rake` will default to building the dummy app if it does not exist, then it will run specs. The dummy app can be regenerated by using `rake test_app`.

```shell
bundle
bundle exec rake
```

When testing your applications integration with this extension you may use it's factories.
Simply add this require statement to your spec_helper:

```ruby
require 'spree_social_media_marketing/factories'
```


## Contributing

If you'd like to contribute, please take a look at the
[instructions](CONTRIBUTING.md) for installing dependencies and crafting a good
pull request.

Copyright (c) 2016 [name of extension creator], released under the New BSD License
