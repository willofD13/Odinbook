class CommentsController < ApplicationController
    def index
        @post = Post.find(params[:post_id])
        @comments = @post.comments
    end
    
    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.create(comment_params)
        
        respond_to do |format|
            if @comment.save
                format.turbo_stream
            else
                format.html { render 'form' , status: :unprocessable_entity }
            end
        end
    end

    def destroy
        @comment = Comment.find(params[:id])
        @comment.destroy

        redirect_to :root, status: :see_other
    end

    private
    def comment_params
        params.require(:comment).permit(:body,:user_id)
    end

    
end
