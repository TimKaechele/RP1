$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "rp1"

require File.expand_path('../test_classes/property_test_class.rb', __FILE__)

require "minitest/autorun"
