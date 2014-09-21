require "iconik/version"
require "iconik/http_client"
require "json"

module Iconik
  ITUNES_DOMAIN = 'itunes.apple.com'
  GOOGLE_PLAY_DOMAIN = 'play.google.com'
  module ITunes
    def self.get_icon_url(appid)
      get_path = "/lookup?id=#{appid}&country=JP"
      client = Iconik::HttpClient.new(ITUNES_DOMAIN, get_path)
      r = client.response_body
      j = JSON.parse r
      j['results'][0]['artworkUrl60']
    end
  end

  module GooglePlay
    require 'nokogiri'

    # https://play.google.com/store/apps/details?id=jp.gungho.pad
    def self.get_icon_url(appid)
      get_path = "/store/apps/details?id=#{appid}"
      client = Iconik::HttpClient.new(GOOGLE_PLAY_DOMAIN, get_path)
      r = client.response_body
      doc = Nokogiri::HTML.parse(r, nil, nil)
      doc.css(".cover-image")[0][:src]
    end
  end
end
