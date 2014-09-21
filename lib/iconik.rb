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

  module GooglePlay
    # URLにアクセスするためのライブラリの読み込み
    require 'open-uri'
    # Nokogiriライブラリの読み込み
    require 'nokogiri'

    # https://play.google.com/store/apps/details?id=jp.gungho.pad
    def self.get_icon_url(appid)
      domain = 'play.google.com'
      get_path = "/store/apps/details?id=#{appid}"
      doc = get_nokogiri domain, get_path
      doc.css(".cover-image")[0][:src]
    end

    def self.get_nokogiri(domain, get_path)
      https = Net::HTTP.new(domain, 443)
      https.use_ssl = true
      # NOTE dont's use
      # https.ca_file = '/usr/share/ssl/cert.pem'
      https.verify_mode = OpenSSL::SSL::VERIFY_PEER
      https.verify_depth = 5
      charset = nil
      r = https.start {
        response = https.get get_path
        response.body
      }
      # //*[@id="body-content"]/div[1]/div/div[1]/div[1]/img
      # htmlをパース(解析)してオブジェクトを生成
      Nokogiri::HTML.parse(r, nil, charset)
    end
  end
end
