class API < Grape::API
  prefix 'api'
  version 'v1', using: :path
  format :json
  formatter :json, Grape::Formatter::Jbuilder

  helpers do
    def err401
      error!('401 Unauthorized', 401)
    end
  end

  resource :posts do

    #GET api/v1/posts
    get '/', jbuilder:'posts/index' do
      @posts = Post.all.order("created_at DESC")
    end

    #GET api/v1/posts/:id
    get '/:id', jbuilder:'posts/show' do
      @post = Post.find(params[:id])
    end

  end

end
