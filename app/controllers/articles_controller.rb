class ArticlesController < ApplicationController
  #ログインしてなかったらはじく
  before_action :authenticate_user!
  
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  # GET /articles
  def index
    # publicの記事のみ表示
    # ページネーションをつけたいデータに.page(params[:page])を追加
    @articles = Article.where("status = 0").page(params[:page]).per(15).order(created_at: :desc)

   
  end

  # GET /articles/1
  def show
    #@article = Article.find_by(id:params[:id])
    #非公開記事をログインユーザー以外がアクセスした場合の処理
    if @article.status_private? && @article.user != current_user
      respond_to do |format|
        format.html { redirect_to articles_path, notice: "このページにはアクセスできません" }
    end
    end
    @like = Like.new
  end

  # GET /articles/new
  def new
    @article = Article.new
    
  end

  # GET /articles/1/edit
  def edit
    @article = Article.find(params[:id])
  end

  # POST /articles
  def create
    #ユーザーとの関係性を指定する
    @article = current_user.articles.new(article_params)
    
    respond_to do |format|
      if @article.save
        # リクエストされるフォーマットがHTML形式の場合
        format.html { redirect_to @article, notice: '新規投稿を行いました。' }
        # リクエストされるフォーマットがJSON形式の場合
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
        render :new
      end
    end
  end

  # PATCH/PUT /articles/1
  def update
    #set_article参照
    if @article.update(article_params)
      redirect_to @article, notice: 'Article was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /articles/1
  def destroy
    #set_article参照
    @article.destroy
    redirect_to articles_url, notice: 'Article was successfully destroyed.'
  end
  
  def otherIndex
    # publicの記事のみ表示
    # ページネーションをつけたいデータに.page(params[:page])を追加
    @articles = Article.where(user_id: params[:id]).where("status = 0").page(params[:page]).per(15).order(created_at: :desc)
    @user = User.find(params[:id])
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      #自分の記事
      @article = Article.find_by(id: params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def article_params
      #：user_idを追加
      #permit→保存したいカラムを指示
      params.require(:article).permit(
        :title, 
        :user_id, 
        :image,
        :status,
        {:cat_ids => []}
        )
    end
end