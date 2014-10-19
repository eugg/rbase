ActiveAdmin.register PostRelation do
  permit_params :post_id, :tag_id

  form do |f|
    f.inputs "" do
      f.input :post_id, as: :select, collection: Post.all, member_label: Proc.new { |p| p.title }
      f.input :tag_id, as: :select, collection: Tag.all, member_label: Proc.new { |t| t.name_zh }
    end
    f.actions
  end
end
