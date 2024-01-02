class PostsController < ApplicationController
    before_action :authenticate_user!

    def index
        @posts = Post.all 
    end

    def new 
        @post = Post.new
    end

    def create
        @user = User.find(params[:id])
        @post = @user.posts.build(post_params)

        if @post.save
            redirect_to :root, status: :see_other
        else
            render :new, status: :unprocessable_entity
        end
    end

    private
    def post_params
        params.require(:post).permit(:body,:author_id)
    end
end
