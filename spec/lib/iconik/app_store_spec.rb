require 'spec_helper'
require 'iconik/app_store'

describe Iconik do
  describe 'Iconik::AppStore' do
    let(:pluck_icon) { iconik.pluck_icon }
    let(:iconik) { Iconik::AppStore.new(url) }
    context 'Unknown App Domain' do
      let(:url) { 'https://yahoo.com' }
      subject { pluck_icon }
      it { expect { subject }.to raise_error Iconik::UnknownAppDomainError }
    end
    context 'google play' do
      let(:url) { 'https://play.google.com/store/apps/details?id=com.nianticproject.ingress&hl=ja' }
      subject { VCR.use_cassette('google play') { pluck_icon } }
      it { expect(subject).to eq 'https://lh3.ggpht.com/j8lGWdhEjmw5rVZ6CiJY_k5D0iPqp_jomAUdyS_n8v5SUQVb8Dt-USXUZXmx1QAca8zJ=w300' }
    end
    context 'iTunes' do
      let(:url) { 'https://itunes.apple.com/jp/app/ingress/id576505181?mt=8' }
      subject { VCR.use_cassette('iTunes store') { pluck_icon } }
      it { expect(subject).to eq 'http://a1894.phobos.apple.com/us/r30/Purple5/v4/e3/8c/4a/e38c4a06-d8a6-d1d8-a488-21fec841b47b/Icon-57.png' }
    end
  end
end