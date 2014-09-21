require "spec_helper"
require "iconik"

describe Iconik do
  # https://itunes.apple.com/jp/app/ingress/id576505181?mt=8
  describe "Iconik::ITunes" do
    subject { Iconik::ITunes.get_icon_url 576505181 }
    it { expect(subject).to eq 'http://a734.phobos.apple.com/us/r30/Purple4/v4/98/30/af/9830af8b-5e97-9af2-6a1c-8c3ecd593ed8/Icon-57.png' }
  end
  describe "Iconik::GooglePlay" do
    subject { Iconik::GooglePlay.get_icon_url 'com.nianticproject.ingress' }
    it { expect(subject).to eq 'https://lh3.ggpht.com/j8lGWdhEjmw5rVZ6CiJY_k5D0iPqp_jomAUdyS_n8v5SUQVb8Dt-USXUZXmx1QAca8zJ=w300' }
  end
end