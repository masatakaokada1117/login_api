class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(password_encryption)
    @user.save
    render json: {
      access_token: @user.access_token
    }
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :password)
    end
  
    def password_encryption
      user_hash = user_params
      # パスワード暗号化
      user_hash[:encrypted_password] = BCrypt::Password.create(user_hash[:password])
      user_hash[:access_token] = SecureRandom.uuid
      user_hash.delete_if{ |k, v| k == 'password' }
    end
end
