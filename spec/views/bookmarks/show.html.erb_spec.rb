require 'rails_helper'

RSpec.describe "bookmarks/show", type: :view do
  before(:each) do
    @bella = assign(:user, User.create!(name: 'Bella', email: 'dog@dog.com', password: 'pass123'))
    @bookmark = assign(:bookmark, Bookmark.create!(url: 'dogs.com', user: @bella))
  end

  it "renders attributes in <p>" do
    render
  end
end
