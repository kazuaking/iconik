require 'iconik/store'

module Iconik
  class ITunes < Iconik::Store
    attr_reader :appid

    def initialize(arg_url)
      @url = arg_url
      @appid = pluck_app_id(url)
      @client = Iconik::HttpClient.new("http://itunes.apple.com/lookup?id=#{appid}&country=JP")
    end

    def pluck_icon
      j = JSON.parse(client.response_body)
      j['results'][0]['artworkUrl60']
    end

    private

    def pluck_app_id(url)
      md = url.match(/\/id([0-9]+)/)
      raise 'no serch app id.' unless md[1]
      md[1]
    end
  end
end