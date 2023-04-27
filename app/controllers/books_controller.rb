class BooksController < ApplicationController
before_action:correct_user, only:[:edit, :update, :destroy]

def create
  @book = Book.new(book_params)
  @book.user_id = current_user.id
  if @book.save
    flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)
   else
      @user = current_user
      @books = Book.all
      render :index
    end
end

  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
  end

  def show
    @newbook = Book.new
    @book = Book.find(params[:id])
    @books = Book.all
    @user = @book.user
  end

  def edit
    #@newbook = Book.new
    #@user = User.find(params[:id])
    #@books = Book.all
    @user = current_user
    @book = Book.find(params[:id])
  end

def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    flash[:notice] = "You have updated book successfully."
    redirect_to book_path(@book.id)
  else
    @user = current_user
    render :edit
  end
end

def destroy
  book = Book.find(params[:id])  # データ（レコード）を1件取得
    book.destroy  # データ（レコード）を削除
    redirect_to books_path  # 投稿一覧画面へリダイレクト
end

  private
  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end

  def correct_user
    @book = Book.find(params[:id])
    unless @book.user == current_user
    redirect_to books_path
  end
  end

end

