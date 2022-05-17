class UsersController < ApplicationController
  def index
    @user = current_user
    @users = User.all
    @book = Book.new
    @book.user_id = current_user.id
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = Book.all
  end

  def edit
     @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path(user_params), notice:"You have updated user successfully."
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
