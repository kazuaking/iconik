require 'spec_helper'
require 'iconik'

describe Iconik do
  describe 'Iconik::ITunes' do
    let(:iconik) { Iconik::ITunes.new(url) }
    let(:url) { 'https://itunes.apple.com/jp/app/ingress/id576505181?mt=8' }
    context 'scraping: false' do
      context 'normal' do
        subject { VCR.use_cassette('iTunes api') { iconik.pluck_icon } }
        it { expect(subject).to eq 'https://is1-ssl.mzstatic.com/image/thumb/Purple221/v4/0c/86/7d/0c867d57-0a52-5053-3641-4f68856d1099/AppIcon-1x_U007emarketing-0-7-0-85-220.png/60x60bb.jpg' }
      end
      context 'set country JP' do
        let(:iconik) { Iconik::ITunes.new(url, country: :JP) }
        subject { VCR.use_cassette('iTunes api JP') { iconik.pluck_icon } }
        it { expect(subject).to eq 'http://a464.phobos.apple.com/us/r30/Purple1/v4/81/53/ad/8153adc7-b418-7ee1-dbd6-453f9b251c3d/Icon-57.png' }
      end
      context 'set country US' do
        let(:iconik) { Iconik::ITunes.new(url, country: :US) }
        subject { VCR.use_cassette('iTunes api US') { iconik.pluck_icon } }
        it { expect(subject).to eq 'https://is1-ssl.mzstatic.com/image/thumb/Purple221/v4/0c/86/7d/0c867d57-0a52-5053-3641-4f68856d1099/AppIcon-1x_U007emarketing-0-7-0-85-220.png/60x60bb.jpg' }
      end
      context 'id invalid' do
        let(:url) { 'https://itunes.apple.com/jp/app/ingress/id9999?mt=8' }
        subject { VCR.use_cassette('iTunes api invalid id') { iconik.pluck_icon } }
        it { expect { subject }.to raise_error Iconik::ResultCountZero }
      end
      context 'url invalid' do
        let(:url) { 'hoge' }
        subject { iconik.pluck_icon }
        it { expect { subject }.to raise_error Iconik::InvalidURIError }
      end
    end
    context 'scraping: true' do
      let(:iconik) { Iconik::ITunes.new(url, scraping: true) }
      subject { VCR.use_cassette('iTunes web') { iconik.pluck_icon } }

      it { expect(subject).to eq 'http://a5.mzstatic.com/us/r30/Purple3/v4/3a/8c/ee/3a8ceebd-4a6b-1506-a8bf-91c81bcd1402/mzl.utrddyvw.175x175-75.jpg' }

      context 'id invalid' do
        let(:url) { 'https://itunes.apple.com/jp/app/ingress/id9999?mt=8' }
        subject { VCR.use_cassette('iTunes web invalid id') { iconik.pluck_icon } }
        it { expect { subject }.to raise_error Iconik::UnknownAppError }
      end
      context 'url invalid' do
        let(:url) { 'hoge' }
        subject { iconik.pluck_icon }
        it { expect { subject }.to raise_error Iconik::InvalidURIError }
      end
    end
  end
end