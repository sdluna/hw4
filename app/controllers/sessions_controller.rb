class SessionsController < ApplicationController
  def new
  end

  def create
    #authenticate user
    # Find user by unique identifier
    @user = User.find_by({"username" => params["username"]})
    #if the user exists, check if they know their pw
    if @user != nil 
      if @user["password"] == params["password"]
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
  end
end
  