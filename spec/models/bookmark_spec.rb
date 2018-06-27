require 'rails_helper'

RSpec.describe Bookmark, type: :model do
 describe 'validations' do
   it { should validate_presence_of(:url) }
 end

 describe 'relations' do
   it { should belong_to(:user) }
   #it { should have_one_attached(:screenshot) } come back to this one!!!
   it { should have_and_belong_to_many(:tags) }
 end

 describe '.search' do
  # let!(:valid_user) {
  #   User.create(name: "test", email: "test@test.com", password: "testing")
  # }
  # let!(:bookmarks) do
  #   [
  #   Bookmark.create(title: 'i love dogs', url: 'url.com', user: valid_user),
  #   Bookmark.create(title: 'dogs are great', url: 'url.com', user: valid_user)
  # ]
  before do
    @valid_user = User.create(name: "test", email: "test@test.com", password: "testing")
    @bookmarks = [
      Bookmark.create(title: 'i love dogs', url: 'url.com', user: @valid_user),
      Bookmark.create(title: 'dogs are great', url: 'url.com', user: @valid_user)
    ]
  end

  it 'should match all bookmarks with dogs in title' do
    expect(Bookmark.search('dogs')).to match_array(@bookmarks)
  end
 end
end
