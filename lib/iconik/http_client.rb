module Iconik
  require 'open-uri'
  class HttpClient
    attr_reader :url

    def initialize(url)
      @url = url
    end

    def response_body
      valid_url
      open(url) do |f|
        charset = f.charset
        f.read
      end
    end

    def valid_url
      uri = URI.parse(url)
      raise Iconik::InvalidURIError.new unless [URI::HTTP, URI::HTTPS].any? { |k| uri.kind_of?(k) }
    end
  end
end
