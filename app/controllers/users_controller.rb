class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.user_id = current_user.id
    @user.save
    redirect_to user_path(@user), notice: 'You have created book successfully.'
  end

  def index
    @users = User.all
    @user = current_user
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render 'edit'
    else
      redirect_to user_path(current_user)
    end
  end

  def followers
    user = User.find(params[:id])
    @users = user.followers
  end

  def followeds
    user = User.find(params[:id])
    @users = user.followeds
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
      redirect_to user_path(@user.id), notice: 'You have updated user successfully.'
    else
      @users = User.all
      render :edit, notice: 'Name is too short (minimum is 2 characters)'
    end
  end

  def show
    @user = User.find(params[:id])
    @book_new = Book.new
    @books = @user.books
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
