module Iconik
  require 'open-uri'
  class HttpClient
    attr_reader :url

    def initialize(url)
      @url = url
    end

    def response_body
      get_response(url)
    end

    private

    def valid_url(arg_url)
      uri = URI.parse(arg_url)
      raise Iconik::InvalidURIError.new unless [URI::HTTP, URI::HTTPS].any? { |k| uri.kind_of?(k) }
    end

    def get_response(arg_url, limit = 10)
      valid_url(arg_url)
      response = Net::HTTP.get_response(URI.parse(arg_url))
      case response
      when Net::HTTPSuccess
        response.body
      when Net::HTTPRedirection
        get_response(response['location'], limit - 1)
      else
        response.value
      end
    end
  end
end
