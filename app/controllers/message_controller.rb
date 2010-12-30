class MessageController < ApplicationController
  before_filter :login_required
  layout nil

  # Save a message
  def new
    #get the parameters
    txt = params[:text]
    @user = User.where(:name => session[:name]).first
    # create a message
    @message = Message.new(:text => txt, :user => @user, :date => Time.now)
    # save it 
    if @message.save
      render '_msg', :locals => { :message => @message }
    else
      render :text => 'error'
    end
  end
  
  # Show all the messages
  def all
    @messages = Message.order_by(:date.asc)
    render "_allMessages"
  end

  private

  def login_required
    if not User.where(:name => session[:name]).first
      redirect_to "/"
    end
  end
  
end