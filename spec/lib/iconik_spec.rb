require "spec_helper"
require "iconik"

describe Iconik do
  # https://itunes.apple.com/jp/app/ingress/id576505181?mt=8
  describe "Iconik::ITunes" do
    subject { Iconik::ITunes.get_icon_url 'https://itunes.apple.com/jp/app/ingress/id576505181?mt=8' }
    it { expect(subject).to eq 'http://a5.mzstatic.com/us/r30/Purple4/v4/53/8c/f5/538cf5ae-f6fe-ef7b-15fd-bb7d7d84563a/mzl.vwbatafr.175x175-75.jpg' }
  end
  describe "Iconik::GooglePlay" do
    subject { Iconik::GooglePlay.get_icon_url 'https://play.google.com/store/apps/details?id=com.nianticproject.ingress&hl=ja' }
    it { expect(subject).to eq 'https://lh3.ggpht.com/j8lGWdhEjmw5rVZ6CiJY_k5D0iPqp_jomAUdyS_n8v5SUQVb8Dt-USXUZXmx1QAca8zJ=w300' }
  end
end