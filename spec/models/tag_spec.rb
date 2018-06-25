require 'rails_helper'

RSpec.describe Tag, type: :model do
 describe 'relations' do
   it { should have_and_belong_to_many(:bookmarks) }
 end

end
