class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  helper_method :current_user

  def send_mail(name, email, message)
    m = Mandrill::API.new
    #debugger
    message = {  
     :subject=> "Hello from the Mandrill API",  
     :from_name=> "Here's The Thing",  
     :text=>message,  
     :to=>[  
       {  
         :email=> email,  
         :name=> name,  
       }  
     ],  
     :html=>"<html>
          <h1> #{message} </h1>
          <a href='http://localhost:3000'>Link to Here's the Thing</a>
            </html>",  
     :from_email=>"sender@yourdomain.com"  
    }  
    sending = m.messages.send message  
    puts sending
  end


  helper_method :send_email

end
