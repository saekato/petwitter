class MypageController < ApplicationController
    before_action :authenticate_user!
    
    def index
        # publicの記事のみ表示
    # ページネーションをつけたいデータに.page(params[:page])を追加
    @articles = Article.where(user_id: current_user.id).page(params[:page]).per(15).order(created_at: :desc)
    end
    
    
end
