require "spec_helper"

describe "Whitelabel" do

  describe "GET page with non existing subdomain" do
    it "redirects to main url" do
      get root_url(subdomain: "rostock")
      response.should redirect_to(root_url(subdomain: false, locale: 'de'))
    end
  end

  describe "GET page with existing subdomain" do
    before { create(:whitelabel) }

    it "shows the whitelabel" do
      get root_url(subdomain: "hamburg")
      response.should be_success
    end
  end

end
