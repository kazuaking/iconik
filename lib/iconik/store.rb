module Iconik
  class Store
    attr_reader :url, :client
    def initialize(url)
      @url = url
      @client = Iconik::HttpClient.new(url)
    end
  end
end