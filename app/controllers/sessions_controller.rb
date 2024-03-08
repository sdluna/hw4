class SessionsController < ApplicationController
  def new
  end

  def create
    #authenticate user
    # Find user by unique identifier
    @user = User.find_by({"username" => params["username"]})
    #if the user exists, check if they know their pw
    if @user != nil 
      if BCrypt::Password.new(@user["password"]) == params["password"]
        #create user id cookies for tracking/conditional logic
        session["user_id"] = @user["id"]
        flash["notice"] = "Welcome!"
        redirect_to "/places"  
      else 
        flash["notice"] = "Sorry, we could not find an account with those details."
        redirect_to "/login"
      end

    else
      flash["notice"] = "Sorry, we could not find an account with those details."
      redirect_to "/login"
    end
  end

  def destroy
    #logout the user
    session["user_id"] = nil
    flash["notice"] = "Goodbye."
    redirect_to "/login"
  end
  
end
  