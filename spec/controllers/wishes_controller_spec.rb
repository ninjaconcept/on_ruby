require 'spec_helper'

describe WishesController do

  let(:wish) { create(:wish) }
  let(:user) { create(:user) }

  before { set_subdomain }

  describe "GET :show" do
    before { get :show, id: wish.id }

    it "should assign members" do
      controller.wish.should eql(wish)
      response.should render_template(:show)
    end
  end

  describe "POST :create" do
    before { create(:whitelabel) }

    it "should create a wish for logged-in user" do
      @controller.stubs(current_user: user)
      expect {
        expect {
          post(:create, {wish: attributes_for(:wish)})
        }.to change(Vote, :count).by(1)
      }.to change(Wish, :count).by(1)
      controller.wish.user.should eql(user)
      flash[:notice].should_not be_nil
    end

    it "should not create a wish if not signed in" do
      expect { post(:create, {wish: attributes_for(:wish)}) }.to change(Wish, :count).by(0)
      response.should redirect_to(auth_path)
    end
  end

end
