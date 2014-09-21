module Iconik
  require 'open-uri'
  class HttpClient
    attr_reader :url

    def initialize(url)
      @url = url
      # @domain = domain
      # @path = path
    end
    def response_body
      open(url) do |f|
        charset = f.charset
        f.read
      end
      # https = Net::HTTP.new(domain, 443)
      # https.use_ssl = true
      # # NOTE: dont's use
      # # https.ca_file = '/usr/share/ssl/cert.pem'
      # https.verify_mode = OpenSSL::SSL::VERIFY_PEER
      # https.verify_depth = 5
      # https.start {
      #   response = https.get path
      #   response.body
      # }
    end
  end
end
