require "test_helper"

class RP1Test < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Rp1::VERSION
  end

  def test_it_does_something_useful
    assert true
  end

  def test_it_has_a_class_attribute
    RP1.configure do |config|
      config.redis_connection = Redis.new
    end
    ptc = PropertyTestClass.new
    binding.irb
  end
end
