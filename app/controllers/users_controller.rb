class UsersController < ApplicationController

def create
  @book = Book.new(book_params)
  @book.user_id = current_user.id
  if @book.save
   redirect_to book_path(@book.id)
   else
      redirect_to books_path
    end
end

  def show
    @newbook = Book.new
    @book = Book.find(params[:id])
    @books = Book.all
    @user = current_user
  end

  def edit
  end
  
  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
  end
end
