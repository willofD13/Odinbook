class FollowsController < ApplicationController
    def new
        @follow = Follow.new
    end


    def create
        @user = User.find(params[:follow][:followed_user_id])
        @follow = @user.received_follows.build(follow_params)

        if @follow.save
            redirect_to :root, status: :see_other
        else
            render :new, status: :unprocessable_entity
        end
    end

    private
    def follow_params
        params.require(:follow).permit(:follower_id, :followed_user_id)
    end
end
