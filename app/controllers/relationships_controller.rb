class RelationshipsController < ApplicationController
  before_action :logged_in_user

  def create
    @atcoder_user = AtcoderUser.find(params[:followed_id])
    current_user.follow(@atcoder_user)

    respond_to do |format|
      format.html { redirect_to '/search' }
      format.js
    end
  end

  def destroy
    @atcoder_user = Relationship.find(params[:id]).followed
    current_user.unfollow(@atcoder_user)
    respond_to do |format|
      format.html { redirect_to '/search' }
      format.js 
    end
  end
end
