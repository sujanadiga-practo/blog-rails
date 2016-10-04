class CommentsController < ApplicationController
  before_filter :authenticate_user!
  before_action :get_article, only: [:create, :destroy]

  def create
    @user = current_user
    @comment = @article.comments.create({message: params[:comment][:message], user_id: @user.id})

    redirect_to article_path(@article)
  end

  def destroy
    @comment = @article.comments.find(params[:id])

    @comment.destroy
    redirect_to article_path(@article)
  end

  private
    def get_article
      @article = Article.find(params[:article_id])
    end
end
