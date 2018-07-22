class BookmarksController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_bookmark, only: [:show, :edit, :update, :destroy]
                :authenticate_user!
  
  def index
    @tags = current_user.bookmarks.collect {|bm| bm.tags}.flatten.uniq.sort_by &:tag
    @bookmarks = current_user.bookmarks.page(params[:page]).newest

    if params[:tag]
      tag_ids = params[:tag].map {|tag| tag.to_i}
      @bookmarks = @bookmarks.select{ |bm| (tag_ids - bm.tags.ids).empty? }
    end

    if params[:search]
      @bookmarks = @bookmarks.search(params[:search])
    end

    if params[:created_at] == "oldest"
      @bookmarks = @bookmarks.sort_by{|bookmark| bookmark.created_at}
    end
  end

  def show
  end

  def new
    @bookmark = Bookmark.new
    @tag = Tag.new
  end

  def edit
  end

  def create
     if params[:bookmark][:auto]
      file = Tempfile.new('screenshot')
      file.binmode
      file.write(Base64.decode64(params[:bookmark][:screenshot][:io]))
      file.close
      upload = ActionDispatch::Http::UploadedFile.new({
          filename: 'screenshot.jpg',
          content_type: 'image/jpeg',
          tempfile: file
      })
      params[:bookmark][:screenshot] = upload
    end

    @bookmark = current_user.bookmarks.new(bookmark_params)

    if params[:bookmark][:tags]
      tags = params[:bookmark][:tags].select do |tag|
        !tag.empty?
      end
      tags.each do |tag_id|
       tag = Tag.find(tag_id)
          @bookmark.tags << tag
      end
    end

    respond_to do |format|
      if @bookmark.save
        format.html { redirect_to '/', notice: 'Bookmark was successfully created.' }
        format.json { render :show, status: :created, location: @bookmark }
      else
        format.html { render :new }
        format.json { render json: @bookmark.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if params[:bookmark][:tags]
      tags = params[:bookmark][:tags].select do |tag|
        !tag.empty?
      end
      tags.each do |tag_id|
       tag = Tag.find(tag_id)
          @bookmark.tags << tag
      end
    end

    respond_to do |format|
      if @bookmark.update(bookmark_params)
        format.html { redirect_to @bookmark, notice: 'Bookmark was successfully updated.' }
        format.json { render :show, status: :ok, location: @bookmark }
      else
        format.html { render :edit }
        format.json { render json: @bookmark.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @bookmark.destroy
    respond_to do |format|
      format.html { redirect_to bookmarks_url, notice: 'Bookmark was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_bookmark
      @bookmark = Bookmark.find(params[:id])
    end

    def bookmark_params
      params.require(:bookmark).permit(:url, :screenshot, :title, :tags )
    end
end
