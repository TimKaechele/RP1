require 'redis'

require "rp1/types/boolean"
require "rp1/types/string"
require "rp1/types/integer"
require "rp1/types/float"
require "rp1/types/timestamp"

require "rp1/version"
require "rp1/configuration"
require "rp1/persistence"
require "rp1/attribute"
require "rp1/index"
require "rp1/model"

module RP1
  @configuration = Configuration.new

  class Error < StandardError; end

  def self.configure(&block)
    yield @configuration
  end

  def self.configuration
    @configuration
  end

  def self.persistence
    @persistence ||= Persistence.new(@configuration)
  end
end
