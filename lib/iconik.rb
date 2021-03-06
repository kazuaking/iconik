require 'iconik/version'
require 'iconik/http_client'
require 'iconik/google_play'
require 'iconik/i_tunes'
require 'iconik/app_store'
require 'json'

module Iconik
  class InvalidURIError < StandardError; end
  class UnknownAppError < StandardError; end
  class UnknownAppDomainError < StandardError; end
  class ResultCountZero < StandardError; end
end
