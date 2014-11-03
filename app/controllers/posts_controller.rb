class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    data = params.require(:post).permit(
        :title,
        :body,
        :category_id,
        :open_date,
        :close_date,
        :open_time,
        :close_time,
        :charge,
        :promoter,
        :url,
        :facebook,
        :twitter,
        :mial
      ).merge(
        :id_hash => BCrypt::Password.create("my password"),
        :manager_id => 1
      )
    @post = Post.new(data)
    @post.save
    redirect_to posts_path
  end

end
