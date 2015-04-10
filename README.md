# hubot-cronjob

Hubot scriptable cron job.

It's just like [miyagawa/hubot-cron](https://github.com/miyagawa/hubot-cron), but controlled via source code instead of user-facing commands. If you wish to allow your users create cron jobs themselves, use that package.

## Usage

An example that fetches restaurant menu every workday at 11am

    HubotCron = require 'hubot-cronjob'
    fetchRestaurantMenu = require 'my-restaurant-api'

    module.exports = (robot) ->
      # monday to friday, 11am
      pattern = '0 11 * * 1-5'
      timezone = 'Europe/Prague'
      fn = fetchRestaurantMenu (err, menu) ->
        if err
          return console.error err
        robot.messageRoom 'lunchroom', menu
      new HubotCron pattern, timezone, fetchRestaurantMenu

## How to install

    npm install --save hubot-cronjob
