class SessionsController < ApplicationController
    def new 
end
def create
  @user = User.find_by_email(params[:session][:email])
  if @user && @user.authenticate(params[:session][:password])
     session[:user_id] = @user.id
     session[:first_name] = @user.first_name
      redirect_to '/uploads'
  else
    redirect_to '/login' 
  end 
end
def destroy 
  session[:user_id] = nil 
  session[:first_name] =nil
  redirect_to '/'
end
end
