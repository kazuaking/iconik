require 'iconik/version'
require 'iconik/http_client'
require 'iconik/google_play'
require 'iconik/i_tunes'
require 'json'

module Iconik
  class InvalidURIError < Exception; end
  class UnknownAppError < Exception; end
end
