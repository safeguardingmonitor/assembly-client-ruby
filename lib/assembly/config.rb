module Assembly
  class Config
    attr_accessor :host, :token, :refresh_token, :client_id, :client_secret

    def initialize(options={})
      @host = "https://platform.assembly.education"
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
  end
end