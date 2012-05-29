class SessionsController < ApplicationController
  
  def new
    
  end
  
  def create
    user = User.find_by_email(params[:email].downcase)
    if user && user.authenticate(params[:password])
      session[:cookie] = user.id
      redirect_to root_url, notice: "Welcome, #{user.first}!"
    else
      flash[:notice] = 'Invalid username/password.'
      render :new
    end
  end
  
  def destroy
    reset_session
    redirect_to root_url, notice: 'Come back soon!'
  end
  
end