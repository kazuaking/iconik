module Iconik
  require 'iconik/http_client'
  require 'iconik/google_play'
  require 'iconik/i_tunes'
  class AppStore
    attr_reader :url, :store

    def initialize(url: url, scraping: false)
      @url = url
      @scraping = scraping
      @store = Iconik::ITunes.new(url, scraping: scraping) if i_tunes?
      @store = Iconik::GooglePlay.new(url) if google_play?
    end

    def pluck_icon
      @store.pluck_icon
    end

    private

    def i_tunes?
      url.include?('//itunes.apple.com/')
    end

    def google_play?
      url.include?('//play.google.com/')
    end
  end
end