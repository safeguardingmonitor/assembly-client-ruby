module Assembly
  module Middleware
    class RequestVersion
      def initialize(app, options = {})
        @app = app
        @options = options
        @api_version = options[:version].nil? ? 1 : options[:version]
        @accept = "application/vnd.assembly+json; version=#{@api_version.to_s}".freeze
      end

      def call(env)
        env[:request_headers]['Accept'] = @accept
        @app.call(env)
      end
    end
  end
end