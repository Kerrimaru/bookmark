require 'rails_helper'

RSpec.describe "bookmarks/edit", type: :view do
  before(:each) do
    @bella = assign(:user, User.create!(name: 'Bella', email: 'dog@dog.com', password: 'pass123'))
    @bookmark = assign(:bookmark, Bookmark.create!(url: 'dogs.com', user: @bella))
  end

  it "renders the edit bookmark form" do
    render

    assert_select "form[action=?][method=?]", bookmark_path(@bookmark), "post" do
    end
  end
end
