class PostsController < ApplicationController

  def index
    @posts = Post.all.order(created_at: :desc).page(1).per(100)
  end

  def category
    @category = Category.find_by(:title => params[:category])
    if @category == nil
      return redirect_to :root
    end
    @posts = Post.where(:category_id => @category.id).order(created_at: :desc).page(1).per(100)
    render :action => 'index'
  end

  def show
    @post = Post.find_by(:id => params[:id])
    if @post == nil
      return redirect_to :root
    end
  end

  def new
    @post = Post.new
    disable_mobile_view!
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

    redirect_to complete_post_path(@post.id_hash)
  end

  def complete
    @id_hash = params[:hash_id]
  end

end
