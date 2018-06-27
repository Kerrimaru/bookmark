require 'rails_helper'

RSpec.describe "bookmarks/new", type: :view do
  before(:each) do
    @bella = assign(:user, User.create!(name: 'Bella', email: 'dog@dog.com', password: 'pass123'))
    assign(:bookmark, Bookmark.new(url: 'dogs.com', user: @bella))
  end

  it "renders new bookmark form" do
    render

    assert_select "form[action=?][method=?]", bookmarks_path, "post" do
    end
  end
end
