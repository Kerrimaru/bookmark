class TagsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!

  def index
    @tags = Tag.all
  end

  def new
  end

  def create
    @tag = Tag.new(tag_params)
    respond_to do |format|
      if @tag.save
        format.html { redirect_to "/bookmarks", notice: 'tag was successfully created.' }
        format.json { render :index, status: :created, location: @tag }
      else
        format.html { render :new }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def tag_params
      params.require(:tag).permit(:tag)
    end

end
