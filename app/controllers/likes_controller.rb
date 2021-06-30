class LikesController < ApplicationController
    def create
    @like = current_user.likes.create(article_id: params[:article_id])
    redirect_back(fallback_location: root_path)
    @like = Like.new(user_id: @current_user.id, post_id: params[:post_id])
    @like.save
    redirect_to("/posts/#{params[:post_id]}")
  end
  end

  def destroy
    @like = Like.find_by(article_id: params[:article_id], user_id: current_user.id)
    @like.destroy
    redirect_back(fallback_location: root_path)
  end
 end 
