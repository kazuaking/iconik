require 'spec_helper'
require 'iconik'

describe Iconik do
  describe 'Iconik::ITunes' do
    let(:iconik) { Iconik::ITunes.new(url) }
    let(:url) { 'https://itunes.apple.com/jp/app/ingress/id576505181?mt=8' }
    context 'scraping: false' do
      context 'normal' do
        # https://itunes.apple.com/jp/app/ingress/id576505181?mt=8
        subject { VCR.use_cassette('iTunes api') { iconik.pluck_icon } }
        it { expect(subject).to eq 'http://a734.phobos.apple.com/us/r30/Purple4/v4/98/30/af/9830af8b-5e97-9af2-6a1c-8c3ecd593ed8/Icon-57.png' }
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

      it { expect(subject).to eq 'http://a5.mzstatic.com/us/r30/Purple4/v4/53/8c/f5/538cf5ae-f6fe-ef7b-15fd-bb7d7d84563a/mzl.vwbatafr.175x175-75.jpg' }

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