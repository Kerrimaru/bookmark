require 'rails_helper'

RSpec.describe TagsController, type: :controller do

 let(:valid_user) do
    User.create(name: "test", email: "test@test.com", password: "testing")
  end

  let(:bookmark) do
    {title: 'bookmark_title', url: 'url.com', user: valid_user}
  end

  let(:valid_attributes) do
    {tag: 'dog tag'}
  end

  let(:invalid_attributes) { {tag: ''} }

  before do
    sign_in valid_user
  end

  describe "GET #index" do
    it "returns a success response" do
      tag = Tag.create! valid_attributes
      get :index, params: { user: valid_user }
      expect(response).to be_success
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}
      expect(response).to be_success
    end
  end

  # describe "GET #edit" do
  #   it "returns a success response" do
  #     tag = Tag.create! valid_attributes
  #     get :edit, params: {id: tag.to_param}, session: valid_session
  #     expect(response).to be_success
  #   end
  # end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Tag" do
        expect {
          post :create, params: {tag: valid_attributes}
        }.to change(Tag, :count).by(1)
      end

      it "redirects to the home page" do
        post :create, params: {tag: valid_attributes}
        expect(response).to redirect_to(root_path)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {tag: invalid_attributes}
        expect(response).to be_success
      end
    end
  end

  # describe "PUT #update" do
  #   context "with valid params" do
  #     let(:new_attributes) {
  #       skip("Add a hash of attributes valid for your model")
  #     }

  #     it "updates the requested tag" do
  #       tag = Tag.create! valid_attributes
  #       put :update, params: {id: tag.to_param, tag: new_attributes}, session: valid_session
  #       tag.reload
  #       skip("Add assertions for updated state")
  #     end

  #     it "redirects to the tag" do
  #       tag = Tag.create! valid_attributes
  #       put :update, params: {id: tag.to_param, tag: valid_attributes}, session: valid_session
  #       expect(response).to redirect_to(tag)
  #     end
  #   end

  #   context "with invalid params" do
  #     it "returns a success response (i.e. to display the 'edit' template)" do
  #       tag = Tag.create! valid_attributes
  #       put :update, params: {id: tag.to_param, tag: invalid_attributes}, session: valid_session
  #       expect(response).to be_success
  #     end
  #   end
  # end

  # describe "DELETE #destroy" do
  #   it "destroys the requested tag" do
  #     tag = Tag.create! valid_attributes
  #     expect {
  #       delete :destroy, params: {id: tag.to_param}, session: valid_session
  #     }.to change(Tag, :count).by(-1)
  #   end

  #   it "redirects to the tags list" do
  #     tag = Tag.create! valid_attributes
  #     delete :destroy, params: {id: tag.to_param}, session: valid_session
  #     expect(response).to redirect_to(tags_url)
  #   end
  # end

end
