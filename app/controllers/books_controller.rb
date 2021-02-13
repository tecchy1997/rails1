class BooksController < ApplicationController

  def new
   @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to show_book_path(@list.id)
      flash[:notice] = "Book was successfully created"
    else
      @lists = List.all
      render "index"
    end
  end

  def index
    @list = List.new
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end
  def update
    @list = List.find(params[:id])
    if @list.update(list_params)
      flash[:notice] = "Book was successfully updated."
      redirect_to show_book_path(@list.id)
    else
      render "edit"
    end
  end
  def destroy
    list = List.find(params[:id])  # データ（レコード）を1件取得
    list.destroy  # データ（レコード）を削除
    redirect_to books_path  # 投稿一覧画面へリダイレクト
    flash[:notice] = "Book was successfully deleted."
  end

  private
  # ストロングパラメータ
  def list_params
    params.require(:list).permit(:title, :body)
  end
end