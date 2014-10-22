require 'iconik/http_client'
require 'iconik/google_play'
require 'iconik/i_tunes'

module Iconik
  class AppStore
    attr_reader :url, :store

    def initialize(url, scraping: false)
      @url = url
      @store = Iconik::ITunes.new(url, scraping: scraping) if i_tunes?
      @store = Iconik::GooglePlay.new(url) if google_play?
    end

    def pluck_icon
      raise UnknownAppDomainError unless store
      store.pluck_icon
    end

    private

    def i_tunes?
      url.include?('//itunes.apple.com/')
    end

    def google_play?
      url.include?('//play.google.com/') || url.include?('//market.android.com/')
    end
  end
end