class BooksController < ApplicationController
  def index
    @book = Book.new
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
  end

  def create
    @book = Book.new(book_params)
    @books = Book.all
    if @book.save
      redirect_to book_path(@book.id), notice: "successfully"
    else
      render action: :index
    end
  end


  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
     redirect_to book_path, notice: "successfully"
    else
      render action: :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to new_book_path(book.id), notice: "successfully"
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
