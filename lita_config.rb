require './lita-reminder'

Lita.configure do |config|

  # Create local_env.yml file to store your private settings
  env_file = 'config.yml'

  YAML.load(File.open(env_file)).each { |k,v | ENV[k.to_s] = v } if File.exists?(env_file)

  # The name your robot will use.
  config.robot.name = ENV['hipchat_name']

  # The locale code for the language to use.
  config.robot.locale = :en

  # The severity of messages to log. Options are:
  # :debug, :info, :warn, :error, :fatal
  # Messages at the selected level and above will be logged.
  config.robot.log_level = :debug

  # An array of user IDs that are considered administrators. These users
  # the ability to add and remove other users from authorization groups.
  # What is considered a user ID will change depending on which adapter you use.
  # config.robot.admins = ["1", "2"]

  config.robot.adapter = :hipchat

  ## Example: Set options for the chosen adapter.
 #config.adapter.username = "myname"
 #config.adapter.password = "secret"

  ## Example: Set options for the Redis connection.
  config.redis = {

    host: "127.0.0.1",
    port: 6379
  }

  ## Example: Set configuration for any loaded handlers. See the handler's
  ## documentation for options.
 #config.handlers.some_handler.some_config_key = "value"

  config.adapters.hipchat.jid      = ENV['hipchat_jid']
  config.adapters.hipchat.password = ENV['hipchat_password']
  config.adapters.hipchat.debug = true
  config.adapters.hipchat.rooms = ["test_room"]

  config.handlers.logger.log_file        = "chat.log"
  config.handlers.logger.enable_http_log = true

  config.handlers.reminder.server = 'http://127.0.0.1:3000'
end
