class ChatController < ApplicationController
  before_filter :login_required
  
  def index
    @user = User.where(:name => session[:name]).first
    @users = User.all() 
    @messages = Message.order_by(:date.asc)
    render "index"
  end
  
  private
  
  def login_required
    if not User.where(:name => session[:name]).first
      redirect_to "/"
    end
  end
  
end