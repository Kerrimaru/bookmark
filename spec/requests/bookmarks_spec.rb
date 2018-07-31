require 'rails_helper'

RSpec.describe "Bookmarks", type: :request do
  let(:valid_user) do
    User.create(name: "test", email: "test@test.com", password: "testing")
  end

  # let(:bookmark_atttibutes) do
  #   {title: "I love dogs", url: "dogs.com", user: valid_user}
  # end

  before do
    @tag = Tag.create(tag: "doggos")
    @b1 = Bookmark.create!(title: "I love dogs", url: "dogs.com", user: valid_user, tags: [@tag])
    @b2 = Bookmark.create!(title: "I love poetry", url: "poetry.com", user: valid_user, tags: [@tag], created_at: "Mon, 30 Jul 2018 17:15:59 UTC +00:00")
    @b3 = Bookmark.create!(title: "I love music", url: "music.com", user: valid_user)
    @b4 = Bookmark.create!(title: "I love dogs and puppies", url: "dogsandpuppies.com", user: valid_user)
    sign_in valid_user
  end

  describe "GET /bookmarks" do
    it "should show current users bookmarks" do
      #bookmark = Bookmark.create!(bookmark_atttibutes)
      get bookmarks_path
      expect(response).to have_http_status(200)
      expect(response.body).to include(@b1.title)
      expect(response.body).to include(@b4.title)
    end

    it "filters by title key word" do
      get bookmarks_path, params: {search: "dog"}
      expect(response).to have_http_status(200)
      expect(response.body).to include(@b1.title)
      expect(response.body).to include(@b4.title)
      expect(response.body).to_not include(@b3.title)
    end

    it "filters by tag" do
      get bookmarks_path, params: {tag: [@tag.id]}
      expect(response).to have_http_status(200)
      expect(response.body).to include(@b1.title)
    end

    # it "orders by oldest bookmark first" do
    #   get bookmarks_path, params: {tag: [@tag.id], created_at: "oldest"}
    #   expect(response).to have_http_status(200)
    #   expect(response.body).to include(@b2.title)
    # end

  end

end
