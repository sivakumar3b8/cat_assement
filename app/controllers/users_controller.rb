class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update]

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

  def edit
    render json: @user
  end

  def update
    if @user.update(user_params)
     render json: UserSerializer.new(@user, meta: {message: 'Users Profile Updated Successfully.'
      }).serializable_hash, status: 200
    else
      render json: {errors: format_activerecord_errors(@user.errors), status: 422},
      status: :unprocessable_entity
    end
  end


  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      render json: { message: 'user deleted sucessfull.' }, status: :ok
    else
      render json: { errors: format_activerecord_errors(@user.errors) },
      status: :unprocessable_entity
    end

  end

  private
    def user_params
      params.require(:user).permit(:name, :age, :email, :address, :phone_number)
    end

     def set_user
      @user = User.find(params[:id])
    end
end

