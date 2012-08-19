$:.push File.dirname(__FILE__) + '/../lib'

require 'omniauth-td'
require 'sinatra'

use Rack::Session::Cookie
use OmniAuth::Strategies::Td

get '/' do
  "<a href='/auth/td'>Log in with Treasure Data</a>"
end

get '/auth/td/callback' do
  content_type 'text/plain'
  request.env['omniauth.auth'].inspect
end
