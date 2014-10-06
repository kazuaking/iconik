require 'spec_helper'
require 'iconik'

describe Iconik do
  describe 'Iconik::ITunes' do
    context 'scraping: false' do
      # https://itunes.apple.com/jp/app/ingress/id576505181?mt=8
      let(:url) { 'https://itunes.apple.com/jp/app/ingress/id576505181?mt=8' }
      let(:iconik) { Iconik::ITunes.new(url) }
      subject { VCR.use_cassette('iTunes api') { iconik.pluck_icon } }
      it { expect(subject).to eq 'http://a734.phobos.apple.com/us/r30/Purple4/v4/98/30/af/9830af8b-5e97-9af2-6a1c-8c3ecd593ed8/Icon-57.png' }
    end
    context 'scraping: true' do
      pending '#TODO' do
      # https://itunes.apple.com/jp/app/ingress/id576505181?mt=8
      let(:url) { 'https://itunes.apple.com/jp/app/ingress/id576505181?mt=8' }
      let(:iconik) { Iconik::ITunes.new(url) }
      subject { VCR.use_cassette('iTunes api') { iconik.pluck_icon } }
      it { expect(subject).to eq 'http://a734.phobos.apple.com/us/r30/Purple4/v4/98/30/af/9830af8b-5e97-9af2-6a1c-8c3ecd593ed8/Icon-57.png' }
      end
    end
  end
end