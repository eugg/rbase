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

  private

  def set_post
    Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :user_id, :cover, :post_type, :status)
  end
end
