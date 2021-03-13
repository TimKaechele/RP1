require "test_helper"

class ConfigurationTest < Minitest::Test
  def test_can_be_configured
    redis_connection = Redis.new

    RP1.configure do |config|
      config.redis_connection = redis_connection
    end

    assert_equal redis_connection, RP1.configuration.redis_connection
  end
end
