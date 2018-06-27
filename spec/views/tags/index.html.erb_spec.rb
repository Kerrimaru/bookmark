require 'rails_helper'

RSpec.describe "tags/index", type: :view do
  before(:each) do
    assign(:tags, [
      Tag.create!(tag: 'dogs'),
      Tag.create!(tag: 'beer')
    ])
  end

  it "renders a list of tags" do
    render
  end
end
