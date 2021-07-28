class SessionsController < ApplicationController 
   def new 
   end

   def create 

   end

   def omniauth
    # User.find_or_create_by(name: params["name"])
    user = User.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |u| 
        u.email = auth['info']['email']
        u.username = auth['info']['name']
        u.password = SecureRandom.hex(15)
    end
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