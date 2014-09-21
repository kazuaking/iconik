require "iconik/version"
require "iconik/http_client"
require "json"

module Iconik
  require 'nokogiri'
  module ITunes
    def self.get_icon_url(url)
      client = Iconik::HttpClient.new(url)
      r = client.response_body
      doc = Nokogiri::HTML.parse(r, nil, nil)
      doc.xpath('//*[@id="left-stack"]/div[1]/a[1]/div/img')[0][:'src-swap']
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
