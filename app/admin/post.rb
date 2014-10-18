ActiveAdmin.register Post do
  permit_params :title, :content, :cover, :user_id, :status, :post_type

  controller do
    def create
      @post = current_user.posts.new(post_params)
      if @post.save
        redirect_to admin_post_path(@post)
      else
        render :new
      end
    end

    def post_params
      params.require(:post).permit(:title, :content, :user_id, :cover, :post_type, :status)
    end
  end

  form do |f|
    f.inputs t("active_admin.jobs.job_info") do
      f.input :title
      f.input :cover, :as => :file, :hint => f.template.image_tag(f.object.cover.url(:thumb)) 
      f.input :cover_cache, :as => :hidden 
      f.input :status, as: :select, collection: Post.statuses.keys
      f.input :post_type, as: :select, collection: Post.post_types.keys
      f.input :content, input_html: { class: "redactor" }
    end
    f.actions
  end
end
