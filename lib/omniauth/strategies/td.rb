require 'omniauth-td/version'
require 'td/client'

module OmniAuth
  module Strategies
    class Td
      include OmniAuth::Strategy

      option :fields, [:email]
      option :uid_field, :email

      def request_phase
        form = OmniAuth::Form.new(:title => "Account Info", :url => callback_path)
        options.fields.each do |field|
          form.text_field field.to_s.capitalize.gsub("_", " "), field.to_s
        end
        form.password_field 'Password', 'password'
        form.button "Sign In"
        form.to_response
      end

      def callback_phase
        mail = request['email']
        pass = request['password']
        begin
          api = TreasureData::Client.authenticate(mail, pass)
          cln = TreasureData::Client.initialize(api.apikey)
          @identity ||= {
            :account_id => cln.account.account_id,
            :apikey => api.apikey,
            :email => request['email']
          }
        rescue => e
          return fail!(:invalid_credentials)
        end
        super
      end
      uid { @identity[:account_id] }
      info {
        {
          :account_id => @identity[:account_id],
          :email => @identity[:email]
        }
      }
      credentials { {:apikey => @identity[:apikey]} }
    end
  end
end
