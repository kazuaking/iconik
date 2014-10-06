require 'iconik/store'

module Iconik
  class ITunes < Iconik::Store
    attr_reader :scraping

    def initialize(arg_url, scraping: false)
      @scraping = scraping
      @url = arg_url
      get_url = scraping ? @url : "http://itunes.apple.com/lookup?id=#{pluck_app_id(url)}&country=JP"
      @client = Iconik::HttpClient.new(get_url)
    end

    def pluck_icon
      scraping ? nil : pluck_icon_for_json
    end

    private
    def pluck_icon_for_json
      j = JSON.parse(client.response_body)
      j['results'][0]['artworkUrl60']
    end

    def pluck_app_id(url)
      md = url.match(/\/id([0-9]+)/)
      raise 'no serch app id.' unless md[1]
      md[1]
    end
  end
end