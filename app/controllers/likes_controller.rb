class LikesController < ApplicationController
    def create
        @post = Post.find(params[:like][:liked_post_id])
        @like = @post.likes.build(like_params)

        if @like.save
            redirect_to :root, status: :see_other
        else
            render :new, status: :unprocessable_entity
        end
    end

    private
    def like_params
        params.require(:like).permit(:liked_post_id, :liking_user_id)
    end
end
