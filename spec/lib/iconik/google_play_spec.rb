require 'spec_helper'
require 'iconik'

describe Iconik do
  describe 'Iconik::GooglePlay' do
    context 'normal' do
      let(:url) { 'https://play.google.com/store/apps/details?id=com.nianticproject.ingress&hl=ja' }
      let(:iconik) { Iconik::GooglePlay.new(url) }
      subject { VCR.use_cassette('google') { iconik.pluck_icon } }
      it { expect(subject).to eq 'https://lh3.ggpht.com/j8lGWdhEjmw5rVZ6CiJY_k5D0iPqp_jomAUdyS_n8v5SUQVb8Dt-USXUZXmx1QAca8zJ=w300' }
    end
    context 'id invalid' do
      let(:url) { 'https://play.google.com/store/apps/details?id=aaaaaaaaaaaaaa&hl=ja' }
      let(:iconik) { Iconik::GooglePlay.new(url) }
      subject { VCR.use_cassette('google invalid id') { iconik.pluck_icon } }
      it { expect { subject }.to_not raise_error OpenURI::HTTPError }
    end
    context 'url invalid' do
      let(:url) { 'hoge' }
      let(:iconik) { Iconik::GooglePlay.new(url) }
      subject { iconik.pluck_icon }
      it { expect { subject }.to raise_error Iconik::InvalidURIError }
    end
  end
end