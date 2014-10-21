ActiveAdmin.register User do
  permit_params :name, :email, :password, :password_confirmation

  index do
    column :id
    column :email
    column :name
    column :post do |user|
      table_for user.posts do
        column do |post|
          link_to post.title, [:admin, post]
        end
      end
    end
    column :created_at
    actions
  end

  show do
    attributes_table do
      row :id
      row :email
      row :name
      row :created_at
      row :post do |user|
        table_for user.posts do
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
    f.inputs do
      f.input :email
      f.input :name
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
end
