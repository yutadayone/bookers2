class UsersController < ApplicationController
before_action:correct_user, only:[:edit, :update]
before_action :ensure_guest_user, only: [:edit]

  def show
    @newbook = Book.new
    #@book = Book.find(params[:id])

    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    #@newuser = User.new
    #@users = User.all
    @cuser = current_user
    @user = User.find(params[:id])

  end


  def index
    @book = Book.new
    
    @users = User.all
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)

    flash[:notice] = "You have updated user successfully."
    redirect_to user_path(@user.id)

    else
      render :edit
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end


  def correct_user

    @user = User.find(params[:id])
    unless @user == current_user
    redirect_to user_path(current_user)
    end
  end
  
  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.name == "guestuser"
      redirect_to user_path(current_user) , notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
    end
  end

end
