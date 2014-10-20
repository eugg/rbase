require "rails_helper"

RSpec.describe TagsController, type: :controller do
  let!(:tag) { create(:tag) }
  let!(:post_relation) { create(:post_relation, tag_id: tag.id, post_id: post.id) }
  let!(:post) { create(:post, status: :publish, post_type: :posts) }

  describe "GET show" do
    before do
      allow(Tag).to receive(:find).with(tag.id.to_s).and_return(tag)
      get :show, id: tag.id
      expect(assigns[:tag]).to eq tag
    end
    it "should get right posts" do
      expect(assigns[:tag]).to receive_message_chain(:posts, :publish, :posts, :page).and_return(tag.posts.publish.posts.page)
      get :show, id: tag.id
      expect(assigns[:posts]).to include post
    end
    it "should has right heading" do
      get :show, id: tag.id
      expect(assigns[:heading]).to eq "分類"
      expect(assigns[:sub_heading]).to eq tag.name_zh
    end
    it "should render right status and template" do
      get :show, id: tag.id
      expect(response.status).to eq(200)
      expect(response).to render_template(:index)
    end
  end
end
