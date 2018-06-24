class TagsController < ApplicationController

  before_action :authenticate_user!

  def index
    output = []
    tag_ids = params[:tag]

    tag_ids.each do |tag_id|
      tag = Tag.find(tag_id)
      current_user.bookmarks.each do |bm|
        if bm.tags.include?(tag)
          output << bm
        end
      end
      @bookmarks = output
    end

    @tags = current_user.bookmarks.collect {|bm| bm.tags}.flatten.uniq

    render 'bookmarks/index'
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    respond_to do |format|
      if @tag.save
        format.html { redirect_to '/', notice: 'tag was successfully created.' }
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
