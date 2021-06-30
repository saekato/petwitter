class LikesController < ApplicationController
    def create
        @like = Like.new(user_id: current_user.id, article_id: params[:article_id])
        @like.save
        redirect_to("/articles/#{params[:article_id]}")
    end

  def destroy
    @like = Like.find_by(user_id: current_user.id, article_id: params[:article_id])
    @like.destroy
    redirect_to("/articles/#{params[:article_id]}")
  end
 end 
