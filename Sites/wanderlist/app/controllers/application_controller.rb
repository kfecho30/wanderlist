require './config/environment'
require 'rack-flash'

class ApplicationController < Sinatra::Base
  use Rack::Flash

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "jacuzzi"
  end

  get "/" do
    if logged_in?
      redirect '/destinations'
    else
      erb :index
    end
  end

    helpers do
       def logged_in?
         !!session[:user_id]
       end

       def current_user
         User.find(session[:user_id])
       end
     end
end
