class UsersController < ApplicationController

  def index
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find(params[:id])
    render json: UserSerializer.new(@user).serializable_hash
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: UserSerializer.new(@user).serializable_hash, status: :created
    else
      render json: {errors: format_activerecord_errors(@user.errors)},
      status: :unprocessable_entity
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :age, :email, :address, :phone_number)
    end
end

