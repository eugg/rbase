ActiveAdmin.register Tag do
  permit_params :name_zh, :name_en, :tag_type

  form do |f|
    f.inputs "" do
      f.input :name_zh
      f.input :name_en
      f.input :tag_type, as: :select, collection: Tag.tag_types.keys
    end
    f.actions
  end
end
