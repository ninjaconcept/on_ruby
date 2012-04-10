require "spec_helper"

describe "users/edit" do

  let(:user) { FactoryGirl.build(:user) }

  it "should render successfully" do
    view.stubs(current_user: user, user: user)
    render
  end

end
