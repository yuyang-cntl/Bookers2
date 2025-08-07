class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]
  
  def show
    @user = User.find(params[:id])
    @books = @user.books.page(params[:page])
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    redirect_to user_path(@user), notice: "You have updated user successfully."
    else
      render :edit
    end
  end

  def index
    @users = User.page(params[:page])
    @user = current_user
    @book = Book.new
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :body)
  end

  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to books_path
    end
  end

end
