class SessionsController < ApplicationController
  
  skip_before_action :verify_authenticity_token

# creating  a user login session
  def create
    # finding a user by  username
    user = User.find_by(username: params[:username])

    # if the user is not nil
    if user && user.authenticate(params[:password])
      # encode user by id,username and role
      token = JsonWebToken.encode(user_id: user.id, username: user.username,email: user.email, role: user.role)
      # setting the token on the headers
      response.set_header('Authorization', "Bearer #{token}")
      # return succesful response on the body to the client
      render json: { message: 'Login sucessful', code: 200 }
    else
      # return failed response
      render json: { error: 'Invalid username or password' }, status: :unauthorized
    end
  end

  def show
    if current_user
      render json: current_user, status: :ok
    else
      render json: { error: 'Not logged in' }, status: :unauthorized
    end
  end

  def destroy
    session[:user_id] = nil
    render json: { message: 'User logged out successfully' }, status: :ok
  end

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  # ...
end
