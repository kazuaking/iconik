require 'iconik/store'
require 'nokogiri'

module Iconik
  class GooglePlay < Iconik::Store

    def pluck_icon
      begin
        r = client.response_body
        doc = Nokogiri::HTML.parse(r, nil, nil)
        doc.css('.cover-image')[0][:src]
      rescue => exception
        case exception
        when OpenURI::HTTPError
          raise Iconik::UnknownAppError
        else
          raise exception
        end
      end
    end
  end
end