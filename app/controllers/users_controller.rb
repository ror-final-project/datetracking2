require 'mandrill'  

class UsersController < ApplicationController
   def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Thanks for joining Here's the thing..."
      session[:user_id] = @user.id
      redirect_to "/users"
    else
      flash[:alert] = "There was a problem creating your account. Please try again."
      redirect_to :back
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user && @user.update_attributes(user_params)
      flash[:notice] = "Changes made - good to go!"
      redirect_to user_path(@user)
    else
      flash[:alert] = "Uh Oh - there was an issue with with your updates" 
      redirect_to :back
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user && @user.destroy
      flash[:notice] = "Your user has been deleted."
    else
      flash[:alert] = "There was an issue deleting that user..."
    end
    redirect_to "/users"
  end

  def show
    @user = User.find(params[:id])
    #debugger
    send_mail(@user.fname, @user.email, "your math")
    #debugger
    #respond_to do |format|
       # format.html # show.html.erb
        #format.xml { render :xml => @user }
    #end
  end

  def invite_user
    send_mail(params[:email], "Your friend has invited you to Here's the Thing!")
    redirect_to "/"
  end

# if params[:answer] == 0
#   message(params[:email], "Message is for this")
# elsif params[:answer] == 1

  # def send_mail(name, email, message)
  #   m = Mandrill::API.new
  #   #debugger
  #   message = {  
  #    :subject=> "Hello from the Mandrill API",  
  #    :from_name=> "Here's The Thing",  
  #    :text=>message,  
  #    :to=>[  
  #      {  
  #        :email=> email,  
  #        :name=> name,  
  #      }  
  #    ],  
  #    :html=>"<html>
  #         <h1>Hi, I'd like to invite you to checkout this awesome datetracking app.</h1>
  #         <a href='http://localhost:3000'>Link to Here's the Thing</a>
  #           </html>",  
  #    :from_email=>"sender@yourdomain.com"  
  #   }  
  #   sending = m.messages.send message  
  #   puts sending
  # end

private
def user_params
  params.require(:user).permit(:fname, :lname, :email, :password, :password_confirmation, :photo, :description)
end

end