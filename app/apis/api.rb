class API < Grape::API
  prefix 'api'
  version 'v1', using: :path
  format :json

  helpers do
    def err401
      error!('401 Unauthorized', 401)
    end
  end

  resource :posts do

    #GET api/v1/posts
    get do
      @posts = Post.all.order("created_at DESC")
    end

    #GET api/v1/posts/:id
    get '/:id' do
      @post = Post.find(params[:id])
    end

  end
end
