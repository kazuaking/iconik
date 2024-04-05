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
      it { expect(subject).to eq 'https://is1-ssl.mzstatic.com/image/thumb/Purple221/v4/0c/86/7d/0c867d57-0a52-5053-3641-4f68856d1099/AppIcon-1x_U007emarketing-0-7-0-85-220.png/60x60bb.jpg' }
    end
  end
end