require "iconik/store"
require 'nokogiri'

module Iconik
  class GooglePlay < Iconik::Store

    def pluck_icon
      r = client.response_body
      doc = Nokogiri::HTML.parse(r, nil, nil)
      doc.css(".cover-image")[0][:src]
    end
  end
end