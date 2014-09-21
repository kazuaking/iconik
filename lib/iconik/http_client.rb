module Iconik
  class HttpClient
    attr_reader :domain, :path
    def initialize(domain, path)
      @domain = domain
      @path = path
    end
    def response_body
      https = Net::HTTP.new(domain, 443)
      https.use_ssl = true
      # NOTE: dont's use
      # https.ca_file = '/usr/share/ssl/cert.pem'
      https.verify_mode = OpenSSL::SSL::VERIFY_PEER
      https.verify_depth = 5
      https.start {
        response = https.get path
        response.body
      }
    end
  end
end
