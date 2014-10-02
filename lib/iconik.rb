require "iconik/version"
require "iconik/http_client"
require "json"

module Iconik
  require 'nokogiri'
  module ITunes
    def self.get_icon_url(url)
      app_id = pluck_app_id(url)
      get_path = "http://itunes.apple.com/lookup?id=#{app_id}&country=JP"
      client = Iconik::HttpClient.new(get_path)
      r = client.response_body
      j = JSON.parse r
      j['results'][0]['artworkUrl60']
    end

    def self.get_icon_url_for_scraping(url)
      client = Iconik::HttpClient.new(url)
      r = client.response_body
      doc = Nokogiri::HTML.parse(r, nil, nil)
      doc.xpath('//*[@id="left-stack"]/div[1]/a[1]/div/img')[0][:'src-swap']
    end

    def self.pluck_app_id(url)
      md = url.match(/\/id([0-9]+)/)
      raise 'no serch app id.' unless md[1]
      md[1]
    end
  end

  module GooglePlay
    def self.get_icon_url(url)
      client = Iconik::HttpClient.new(url)
      r = client.response_body
      doc = Nokogiri::HTML.parse(r, nil, nil)
      doc.css(".cover-image")[0][:src]
    end
  end
end
