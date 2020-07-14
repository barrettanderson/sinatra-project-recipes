class SessionsController < ApplicationController
    use Rack::Flash

    get '/login' do
        erb :'/sessions/new'
    end

    post '/login' do
        @user = User.find_by_username(params[:user][:username])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect '/recipes'
        else
            flash.now[:error] = ["Username or password didn't match, please try again"]
            erb :'sessions/new'
        end
    end

    get '/logout' do
        session.clear
        flash[:notice] = "You have successfully logged out. Come cook again soon!"
        redirect '/'
    end

end