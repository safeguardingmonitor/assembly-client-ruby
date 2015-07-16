module Assembly
  class Client
    attr_reader :config
    def initialize(config=Assembly.config)
      @config = config
      build_api_adapter
    end

    def get(url, params={})
      response = @api.get url, params
      check_errors(response)
      response.body
    end

    def post(url, params={})
      response = @api.post url, params.to_json
      response.body
    end

    def put(url, params={})
      response = @api.put url, params.to_json
      response.body
    end

    def delete(url)
      response = @api.delete url
      response.status == 200
    end

    def grade_set
      Assembly::GradeSetResource.new(self)
    end

    def assessment_point
      Assembly::AssessmentPointResource.new(self)
    end

    private

    def check_errors(response)
      raise Assembly::ServerError.new(response) if response.status > 500
      raise Assembly::NotFoundError.new(response) if response.status > 400
      true
    end

    def build_api_adapter
      @api = Faraday.new(:url => config.host) do |faraday|
        faraday.request  :json
        faraday.request  :oauth2, config.token
        faraday.response :json
        faraday.adapter  Faraday.default_adapter
      end
    end
  end

  class ServerError < StandardError
    def initialize(response)
      @response = response
    end

    def status
      @response.status
    end

    def message
      @response.body[:message]
    end

    def to_s
      "[#{status}] #{message}"
    end
  end

  class NotFoundError < ServerError
  end
end

module FaradayMiddleware
  class ParseJson
    define_parser do |body|
      ::JSON.parse(body, symbolize_names: true) unless body.strip.empty?
    end
  end
end