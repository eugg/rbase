class PostsController < ApplicationController
  def index
    @posts = Post.posts.publish.page params[:page]
  end

  def show
    @post = set_post
  end

  def search
    @heading = "搜尋結果"
    @sub_heading = params[:q][:title_cont]
    @posts = @search.result.page params[:page]
    render :index
  end

  def rss
    @rss_info = {
      title: "Rbase",
      description: "Test Test"
    }
    @posts = Post.all.order(created_at: :asc).limit(10).includes(:user, :tags)
    respond_to do |format|
      format.xml { render :rss }
    end
  end

  private

  def set_post
    Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :user_id, :cover, :post_type, :status)
  end
end
