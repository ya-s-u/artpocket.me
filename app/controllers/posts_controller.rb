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
        :pictures,
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
        :mail
      ).merge(
        :id_hash => BCrypt::Password.create("my password"),
        :manager_id => 1,
      )
    @post = Post.new(data)
    @post.save

    if params[:images]
      i = 0;
      params[:images].each do |image|
        @post.pictures.create(:image => image, :priority => i)
        i += 1;
      end
    end

=begin
    data = params.require(:post).permit(:image).merge(:post_id => 1, :priority => 1)
    @picture = Picture.new(data)
    @picture.save
=end
    redirect_to posts_path
  end

end
