class PostsController < ApplicationController
    before_action :authenticate_user!

    def index
        @posts = Post.all 
    end

    def new 
        @post = Post.new
    end

    def show
        @post = Post.find(params[:id])
    end

    def create
        @user = User.find(params[:post][:author_id])
        @post = @user.authored_posts.build(post_params)

        if @post.save
            redirect_to :root, status: :see_other
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        @post = Post.find(params[:id])
    end

    def update 
        @post = Post.find(params[:id])
        @post.update(post_params)

        if @post.save
            redirect_to :root, status: :see_other
        else 
            render :edit, status: :unprocessable_entity
        end
       
    end

    private
    def post_params
        params.require(:post).permit(:body,:author_id)
    end
end
