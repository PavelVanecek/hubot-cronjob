# Allows you to create cron jobs on script level
# Inspider by https://github.com/miyagawa/hubot-cron

# @author Pavel Vanecek <pavel.vanecek@merck.com>

{ CronJob } = require 'cron'

class HubotCron

  constructor: (@pattern, @fn, @context = global) ->
    @cronjob = new CronJob(
      @pattern
      @onTick.bind(this)
      null
      false
      @timezone
    )
    @cronjob.start()

  stop: ->
    @cronjob.stop()

  onTick: ->
    Function::call.apply @fn, @context

module.exports = HubotCron
