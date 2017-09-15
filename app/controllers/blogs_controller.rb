class BlogsController < ApplicationController
  before_action :set_blog, only: [:show,:edit,:update,:destroy] #指定したアクションが実行される前にあるメソッドを実行するようにする

  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.create(blog_params)
    if @blog.save
     redirect_to new_blog_path, notice: "投稿完了しました"
    else
     render'new'
    end
  end

  def edit
  end

  def update
    if @blog.update(blog_params)
      redirect_to blogs_path, notice: "ブログを編集しました"
    else
      render 'edit'
    end
  end

  def show
  end

  def destroy
    @blog.destroy
    redirect_to blogs_path, notice:'ブログを削除しました'
  end



  private
    def blog_params
      params.require(:blog).permit(:title,:content)
    end

    def set_blog
      @blog = Blog.find(params[:id]) #共通処理のメソッド化、idをキーとして値を取得する
    end
end
