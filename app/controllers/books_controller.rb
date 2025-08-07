class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
     redirect_to book_path(@book), notice: 'You have created book successfully.'
    else 
      render :new
    end
  end

  def index
    @books = Book.page(params[:page])
    @user = current_user
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @books = @user.books
  end

  def edit
    @book = Book.find(params[:id])
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

private

  def book_params
    params.require(:book).permit(:title, :body, :user_name)
  end

end
