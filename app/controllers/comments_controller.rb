class CommentsController < ApplicationController
    def create
        @user = User.find(params[:user_id])
        @comment = @post.comments.create(comment_params)
        redirect_to :root, status: :see_other
    end

    def comment_params
        params.require(:comment).permit(:body,:user_id)
    end
end
