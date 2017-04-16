require 'omniauth-oauth2'
require 'multi_json'
require 'multi_xml'

module OmniAuth
  module Strategies
    class ConstantContact2 < OmniAuth::Strategies::OAuth2
      
      DEFAULT_RESPONSE_TYPE = 'code'
      DEFAULT_GRANT = 'authorization_code'
      API_PATH = 'https://api.constantcontact.com/v2'
      
      option :name, "constantcontact"

      option :client_options, {
          :site => 'https://oauth2.constantcontact.com',
          :authorize_url => '/oauth2/oauth/siteowner/authorize',
          :token_url => '/oauth2/oauth/token'
      }

      def authorize_params
        options.authorize_params[:response_type] ||= DEFAULT_RESPONSE_TYPE
        options.authorize_params[:client_id] = client.id
        options.authorize_params.merge(options.authorize_options.inject({}){|h,k| h[k.to_sym] = options[k] if options[k]; h})
      end

      def token_params
        super.tap do |params|
          params[:grant_type] ||= DEFAULT_GRANT
          params[:client_id] = client.id
          params[:client_secret] = client.secret
        end
      end

      uid do
        request.params['username']
      end

      info do
        {
          email: raw_info['email']
        }
      end

      extra do
        { 'raw_info' => raw_info }
      end

      def raw_info
        options = {
          params: {api_key: client.id},
          headers: {'Authorization' => "Bearer #{access_token.token}"}
        }
        @raw_info ||= JSON.parse(access_token.get("#{API_PATH}/account/info", options).body)
      end
    end
  end
end

OmniAuth.config.add_camelization 'constantcontact', 'ConstantContact2'
