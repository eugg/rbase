class TagsController < ApplicationController
  def show
    tag = Tag.find(params[:id])
    @heading = "分類"
    @sub_heading = tag.name_zh
    @posts = tag.posts.publish.posts

    render "posts/index"
  end
end
