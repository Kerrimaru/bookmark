require 'rails_helper'

RSpec.describe "Bookmarks", type: :request do
  let(:valid_user) do
    User.create(name: "test", email: "test@test.com", password: "testing")
  end

  let(:valid_attributes) do
    {title: 'bookmark_title', url: 'url.com', user: valid_user}
  end

  let(:invalid_attributes) { {url: ''} }

  describe "GET /bookmarks" do
    it "should show current users bookmarks" do
      get bookmarks_path
      expect(response).to have_http_status(200)
    end
  end
end
