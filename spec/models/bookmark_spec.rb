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
end