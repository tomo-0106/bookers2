class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_book,only: [:edit]


  def create
    @books = Book.all
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:createbook] = "successfully"

     redirect_to book_path(@book.id)
    else
      render :index
    end
  end

  def index
    @books = Book.all
    @book = Book.new
    @users = User.all

  end

  def show
    @books = Book.all
    @book = Book.find(params[:id])
    @newbook = Book.new
    @user = current_user
  end

  def edit
    @book = Book.find(params[:id])
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:updatebook] = "successfully"
     redirect_to book_path(@book.id)
    else
      render :edit
    end
  end
def correct_book
        @book = Book.find(params[:id])
  unless @book.user.id == current_user.id
      redirect_to books_path
  end
end


  private

  def book_params
    params.require(:book).permit(:title, :image, :body)
  end

end
