class PostsController < ApplicationController

  def index
    @posts = Post.all.order("created_at DESC")
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
        :id_hash => SecureRandom.urlsafe_base64(6),
        :manager_id => 1,
      )
    @post = Post.new(data)
    @post.save

    i = 0;
    params[:images].each do |image|
      if image
        @post.pictures.create(:image => image, :priority => i)
        i += 1;
      end
    end

    redirect_to posts_path
  end

end
