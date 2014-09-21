module Iconik
  require 'open-uri'
  class HttpClient
    attr_reader :url

    def initialize(url)
      @url = url
    end

    def response_body
      open(url) do |f|
        charset = f.charset
        f.read
      end
    end
  end
end
