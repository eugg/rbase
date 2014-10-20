require "rails_helper"

RSpec.describe PostsController, type: :controller do
  let(:post) { create(:post) }
  let(:post_2) { create(:post) }

  describe "GET index" do
    it "should receive right method and assign posts to @posts" do
      expect(Post).to receive_message_chain(:posts, :publish, :page).and_return(Post.all.page)
      get :index
      expect(assigns[:posts]).to include post, post_2
    end
    it "should get right status and render right template" do
      get :index
      expect(response.status).to eq(200)
      expect(response).to render_template(:index)
    end
  end

  describe "GET show" do
    before { expect(Post).to receive(:find).with(post.id.to_s).and_return(post) }
    it "should receive right method and assign post to @post" do
      get :show, id: post.id
      expect(assigns[:post]).to eq(post)
    end
    it "should get right status and render right template" do
      get :show, id: post.id
      expect(response.status).to eq(200)
      expect(response).to render_template(:show)
    end
  end

  describe "GET search" do
    it "should get post" do
      get :search, q: { title_cont: post.title }
      expect(assigns[:search].result).to include post
    end
    it "should not get post" do
      get :search, q: { title_cont: post.title + "1" }
      expect(assigns[:search].result).not_to include post
    end
    it "should has right heading" do
      get :search, q: { title_cont: post.title }
      expect(assigns[:heading]).to eq "搜尋結果"
      expect(assigns[:sub_heading]).to eq post.title
    end
    it "should render right status and template" do
      get :search, q: { title_cont: post.title }
      expect(response.status).to eq(200)
      expect(response).to render_template(:index)
    end
  end
end
