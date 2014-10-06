[![Gem Version](https://badge.fury.io/rb/iconik.svg)](http://badge.fury.io/rb/iconik)
[![Build Status](https://travis-ci.org/kazuaking/iconik.png)](https://travis-ci.org/kazuaking/iconik)
[![Coverage Status](https://coveralls.io/repos/kazuaking/iconik/badge.png?branch=master)](https://coveralls.io/r/kazuaking/iconik?branch=master)

# Iconik

This library gets the icon from the page of GooglePlay and the iTunes store .


## Installation

Add this line to your application's Gemfile:

    gem 'iconik'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install iconik

## Usage

```ruby

require "iconik"

# iTunes store

Iconik::ITunes.get_icon_url 'https://itunes.apple.com/jp/app/ingress/id576505181?mt=8'
=> "http://a5.mzstatic.com/us/r30/Purple4/v4/53/8c/f5/538cf5ae-f6fe-ef7b-15fd-bb7d7d84563a/mzl.vwbatafr.175x175-75.jpg"

# Google play

Iconik::GooglePlay.get_icon_url 'https://play.google.com/store/apps/details?id=com.nianticproject.ingress&hl=ja'
=> "https://lh3.ggpht.com/j8lGWdhEjmw5rVZ6CiJY_k5D0iPqp_jomAUdyS_n8v5SUQVb8Dt-USXUZXmx1QAca8zJ=w300"

```

## TODO


- web thumbnail
- CI


## Contributing

1. Fork it ( https://github.com/kazuaking/iconik/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
