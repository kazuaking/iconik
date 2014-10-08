require 'iconik/store'

module Iconik
  class ITunes < Iconik::Store
    attr_reader :scraping

    def initialize(arg_url, scraping: false)
      @scraping = scraping
      @url = arg_url
    end

    def pluck_icon
      get_url = scraping ? @url : "http://itunes.apple.com/lookup?id=#{pluck_app_id(url)}&country=JP"
      @client = Iconik::HttpClient.new(get_url)
      scraping ? pluck_icon_for_scraping : pluck_icon_for_json
    end

    private
    def pluck_icon_for_scraping
      r = client.response_body
      doc = Nokogiri::HTML.parse(r, nil, nil)
      elem = doc.xpath('//*[@id="left-stack"]/div[1]/a[1]/div/img')
      if elem.size > 0
        elem[0][:'src-swap']
      else
        raise Iconik::UnknownAppError
      end
    end

    def pluck_icon_for_json
      j = JSON.parse(client.response_body)
      raise Iconik::UnknownAppError if j['resultCount'] == 0
      j['results'][0]['artworkUrl60']
    end

    def pluck_app_id(url)
      md = url.match(/\/id([0-9]+)/)
      if md
        md[1]
      else
        raise Iconik::InvalidURIError.new
      end
    end
  end
end