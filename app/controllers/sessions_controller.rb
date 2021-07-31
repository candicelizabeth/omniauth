class SessionsController < ApplicationController 
    def welcome 
        render layout: 'welcome'
    end
   def new 
   end

   def create 
    # byebug
    # @person && @person.name
    # @person.try(:name)
    user = User.find_by_email(params[:user][:email])
    # if user && user.authenticate(params[:user][:password])
    if user.try(:authenticate, params[:user][:password])
        session[:user_id] = user.id
        redirect_to shoes_path
    else
        flash[:message] = "Invalid credentials. Please try again. "
        redirect_to login_path
    end
   end

   def omniauth
    # User.find_or_create_by(name: params["name"])
    user = User.from_omniauth(auth)
    if user.valid? 
        session[:user_id] = user.id
        flash[:message] = "Successful Login!!"
        redirect_to brands_path
    else
    end
    #email 
    #password 
    #username 
    #uid 
    #provider
    # byebug
   end

   def destroy 
    session.delete(:user_id)
    redirect_to brands_path
   end

   private

   def auth 
    request.env['omniauth.auth']
   end
end