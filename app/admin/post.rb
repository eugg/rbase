ActiveAdmin.register Post do
  permit_params :title, :content, :cover, :user_id, :status, :post_type, tag_ids: []
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

  index do
    column :id
    column :title
    column :user do |post|
      post.user.name
    end
    column :tag do |post|
      table_for post.tags do
        column do |tag|
          link_to tag.name_zh, [:admin, tag]
        end
      end
    end
    column :status
    column :post_type

    column :cover do |post|
      image_tag post.cover.url(:thumb)
    end
    column :content do |post|
      raw(post.content.truncate(50))
    end
    column :created_at
    actions
  end

  show do
    attributes_table do
      row :title
      row :status
      row :post_type
      row "作者" do |post|
        post.user.name
      end
      row :cover do |post|
        image_tag post.cover.url
      end
      row :content do |post|
        raw(post.content)
      end
      row :created_at
      row :updated_at
      row :tag do |post|
        table_for post.tags do
          column :name_zh do |tag|
            link_to tag.name_zh, [:admin, tag]
          end
        end
      end
    end
  end

  form do |f|
    f.inputs "文章" do
      f.input :title
      f.input :cover, as: :file, hint: f.template.image_tag(f.object.cover.url(:thumb))
      f.input :cover_cache, as: :hidden
      f.input :status, as: :select, collection: Post.statuses.keys
      f.input :post_type, as: :select, collection: Post.post_types.keys
      f.input :content, input_html: { class: "redactor" }
      f.input :tags, as: :check_boxes, collection: Tag.all, member_label: Proc.new { |a| "#{a.name_zh}" }
    end
    f.actions
  end
end
