class PostsController < ApplicationController

  def index
    @posts = Post.all.order("created_at DESC")
  end

  def category
    category = Category.find_by(:title=>params[:category])
    @posts = Post.where(:category_id=>category.id).order("created_at DESC")
    render :action => 'index'
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
    #render :layout => 'simple'
  end

  def create
    id_hash = SecureRandom.urlsafe_base64(6)

    data = params.require(:post).permit(
        :pictures,
        :title,
        :body,
        :category_id,
        :open_date,
        :close_date,
        :open_time,
        :close_time,
        :place,
        :charge,
        :promoter,
        :url,
        :facebook,
        :twitter,
        :mail
      ).merge(
        :id_hash => id_hash,
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

    UserMailer.post_confirm(@post).deliver if ENV['RAILS_ENV']=='development' || ENV['IS_MAILER']=='enable'

    redirect_to complete_post_path(p: @post.id_hash)
  end

  def complete
    @id_hash = params[:p]
  end

end
