require 'erb'
require 'rack'
require 'omniauth-td/version'
require 'td/client'

module OmniAuth
  module Strategies
    class Td
      include OmniAuth::Strategy

      option :fields, [:email]
      option :uid_field, :email

      VIEW_DIR = File.dirname(__FILE__) + "/../../../view/"

      def request_phase
        tmpl = VIEW_DIR + 'form.erb'
        html = ERB.new(open(tmpl).read).result(binding)
        Rack::Response.new(html).finish
      end

      def callback_phase
        mail = request['email']
        pass = request['password']
        begin
          api = TreasureData::Client.authenticate(mail, pass)
          cln = TreasureData::Client.new(api.apikey)
          @identity ||= {
            :account_id => cln.account.account_id,
            :apikey => api.apikey,
            :email => request['email']
          }
        rescue => e
          p e
          p e.to_s
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
