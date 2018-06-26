require 'rails_helper'

RSpec.describe "bookmarks/index", type: :view do
  before(:each) do
    @bella = assign(:user, User.create!(name: 'Bella', email: 'dog@dog.com', password: 'pass123'))
    assign(:bookmarks, [
      Bookmark.create!(url: 'dogs.com', user: @bella),
      Bookmark.create!(url: 'bark.com', user: @bella)
    ])
  end

  it "renders a list of bookmarks" do
    render
  end
end
