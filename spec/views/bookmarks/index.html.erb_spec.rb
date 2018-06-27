require 'rails_helper'

RSpec.describe "bookmarks/index", type: :view do
  before(:each) do
    @tag = Tag.create!(tag: 'dogs')
    @bella = User.create!(name: 'Bella', email: 'dog@dog.com', password: 'pass123')
    assign(:bookmarks, [
      Bookmark.create!(url: 'dogs.com', user: @bella, tags: @tag),
      Bookmark.create!(url: 'bark.com', user: @bella, tags: @tag)
    ])

   sign_in @bella
  
  end

  it "renders a list of bookmarks" do
    render
  end
end
