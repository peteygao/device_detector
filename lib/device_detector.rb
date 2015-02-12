require 'yaml'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'device_detector/version'
require 'device_detector/version_extractor'
require 'device_detector/memory_cache'
require 'device_detector/parser'
require 'device_detector/bot'
require 'device_detector/client'
require 'device_detector/device'
require 'device_detector/os'

class DeviceDetector

  attr_reader :user_agent

  def initialize(user_agent)
    @user_agent = user_agent
  end

  def name
    client.name
  end

  def full_version
    client.full_version
  end

  def os_name
    os.name
  end

  def os_full_version
    os.full_version
  end

  def device_name
    device.name
  end

  def device_type
    device.device_type
  end

  def known?
    client.known?
  end

  def bot?
    bot.bot?
  end

  def bot_name
    bot.name
  end

  class << self

    class Configuration
      attr_accessor :max_cache_keys

      def to_hash
        {
          max_cache_keys: max_cache_keys
        }
      end
    end

    def config
      @config ||= Configuration.new
    end

    def cache
      @cache ||= MemoryCache.new(config.to_hash)
    end

    def configure(&block)
      @config = Configuration.new
      yield(config)
    end

  end

  private

  def bot
    @bot ||= Bot.new(user_agent)
  end

  def client
    @client ||= Client.new(user_agent)
  end

  def device
    @device ||= Device.new(user_agent)
  end

  def os
    @os ||= OS.new(user_agent)
  end

end
