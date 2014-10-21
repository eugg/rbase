ActiveAdmin.register Tag do
  permit_params :name_zh, :name_en, :tag_type

  index do
    column :id
    column :name_zh
    column :name_en
    column :tag_type
    column :created_at
    actions
  end

  show do
    attributes_table do
      row :id
      row :name_zh
      row :name_en
      row :tag_type
      row :slug
      row :created_at
      row :post do |tag|
        table_for tag.posts do
          column :title do |post|
            link_to post.title, [:admin, post]
          end
          column :user do |post|
            link_to post.user.name, [:admin, post.user]
          end
          column :post_type
          column :status
          column :created_at
        end
      end
    end
  end

  form do |f|
    f.inputs "" do
      f.input :name_zh
      f.input :name_en
      f.input :tag_type, as: :select, collection: Tag.tag_types.keys
    end
    f.actions
  end
end
