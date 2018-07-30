require 'rails_helper'

RSpec.describe "Bookmarks", type: :request do
  let(:valid_user) do
    User.create(name: "test", email: "test@test.com", password: "testing")
  end

  describe "GET /bookmarks" do
    it "should show current users bookmarks" do
      sign_in valid_user
      get bookmarks_path
      expect(response).to have_http_status(200)
    end
  end
end
