require 'spec_helper'
require 'omniauth-constantcontact2'

describe OmniAuth::Strategies::ConstantContact2 do
  subject do
    OmniAuth::Strategies::ConstantContact2.new(nil, @options || {})
  end

  it_should_behave_like 'an oauth2 strategy'

  describe '#client' do
    it 'should have the correct Constant Contact site' do
      expect(subject.client.site).to eq("https://oauth2.constantcontact.com")
    end

    it 'should have the correct authorization url' do
      expect(subject.client.options[:authorize_url]).to eq("/oauth2/oauth/siteowner/authorize")
    end

    it 'should have the correct token url' do
      expect(subject.client.options[:token_url]).to eq('/oauth2/oauth/token')
    end
  end

  describe '#callback_path' do
    it 'should have the correct callback path' do
      expect(subject.callback_path).to eq('/auth/constantcontact/callback')
    end
  end
end
