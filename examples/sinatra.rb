$:.push File.dirname(__FILE__) + '/../lib'

require 'rubygems'
require 'omniauth'
require 'omniauth-td'
require 'sinatra'

use Rack::Session::Cookie
use OmniAuth::Strategies::Td

get '/' do
  "<a href='/auth/td'>Log in with Treasure Data</a>"
end

post '/auth/td/callback' do
  content_type 'text/plain'
  request.env['omniauth.auth'].inspect
  "login succeeded!"
end
