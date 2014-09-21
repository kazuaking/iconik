require "iconik/version"
require "json"

module Iconik
  module ITunes
    def self.get_icon_url(appid)
      domain = 'itunes.apple.com'
      get_path = "/lookup?id=#{appid}&country=JP"
      j = get_json domain, get_path
      j['results'][0]['artworkUrl60']
    end

    def self.get_json(domain, get_path)
      https = Net::HTTP.new(domain, 443)
      https.use_ssl = true
      # NOTE dont's use
      # https.ca_file = '/usr/share/ssl/cert.pem'
      https.verify_mode = OpenSSL::SSL::VERIFY_PEER
      https.verify_depth = 5
      r = https.start {
        response = https.get get_path
        response.body
      }
      JSON.parse r
    end
  end
end
