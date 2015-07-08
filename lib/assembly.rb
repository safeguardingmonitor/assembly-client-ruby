require "assembly/version"
require "assembly/client"

module Assembly
  class Config
    attr_accessor :token, :url, :default_headers, :cache

    def initialize(options={})
      @url = nil
      @default_headers = nil
      @cache = nil
      merge(options)
    end

    def copy_with_overrides(options={})
      copy = self.dup
      copy.merge(options)
      copy
    end

    def merge(options)
      options.each do |key, value|
        send(:"#{key}=", value)
      end
    end

    def options
      {
        url: url,
        default_headers: default_headers,
        cache: cache
      }
    end
  end

  @config = Config.new

  class << self
    attr_accessor :config
  end

  def self.configure(options={})
    self.config = Config.new(options)
    yield(self.config) if block_given?
    self.config
  end

  def self.client(options={})
    client_config = self.config.copy_with_overrides(options)
    connect_oauth(client_config.token, client_config.options)
  end
end
