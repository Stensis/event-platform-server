class UsersController < ApplicationController
  include Authentication

  # Authenticate the request before executing any action, except for :index and :show
  before_action :authenticate_request!, except: [:index, :show]

  # Skip authenticity token verification for :create, :update, and :destroy actions
  skip_before_action :verify_authenticity_token, only: [:create, :update, :destroy]

  # GET /users
  def index
    @users = User.all
    render json: @users
  end

  # GET /users/:id
  def show
    user = User.find(params[:id])
    render json: user, serializer: UserSerializer
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # POST /users
  def create
    user = User.new(user_params)

    if user.save
      render json: { message: 'User created successfully!', user: user }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/:id
  def update
    user = User.find(params[:id])

    if user.update(user_params)
      render json: { message: 'User updated successfully!', user: user }, status: :ok
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /users/:id
  def destroy
    user = User.find(params[:id])
    user.destroy
    render json: { message: 'User deleted successfully!' }
  end

  private

  # Strong parameters for user creation and update
  def user_params
    params.require(:user).permit(:fullname, :username, :email, :password, :role, :profilepicture, :tel)
  end
end
