require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
   it { should validate_presence_of(:email) }
   it { should validate_presence_of(:name) }
 end

 describe 'relations' do
   it { should have_many(:bookmarks) }
 end
end
