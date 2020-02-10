class BookmarksController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_bookmark, only: [:show, :edit, :update, :destroy]
                :authenticate_user!
  
  def index
    @tags = current_user.bookmarks.collect {|bm| bm.tags}.flatten.uniq.sort_by &:tag
    @bookmarks = current_user.bookmarks.page(params[:page]).newest
    # react code following!
    @user = current_user

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

    # JSON::extract! @bookmarks[0], :id, :url, :screenshot, :title, :created_at, :updated_at, :tags
    # JSON::url bookmark_url(@bookmarks[0], format: :json)
    # format.json { render json: Jbuilder.new { |json| json.array! @bookmarks, :screenshot  }.target! }
    # format.json { render json: @bookmarks[0].select(:screenshot) }
    # format.json { render json: @bookmarks[0], status :screenshot }
    
    # respond_to do |format|
    #   # format.json { render json: @bookmarks[0].select(:screenshot) }
    #   # format.json { render json: {}, status: :ok}
    #   format.json { render json: Jbuilder.new { |json| json.array! @bookmarks, :id, :url, :screenshot, :title, :created_at, :updated_at, :tags  }.target! }
    # end

    #  binding.pry
    #uncomment for react, comment out both for rails
    # render json: @bookmarks.to_json  
    # render @bookmarks

    render json: @bookmarks.map { |bookmark| bookmark.as_json.merge({ screenshot: url_for(bookmark.screenshot), tags: bookmark.tags, user: @user })}
  end

  def show
  end

  def new
    @bookmark = Bookmark.new
  end

  def edit
    @tag = Tag.new
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
        !tag.empty? && !@bookmark.tags.ids.include?(tag)
      end
      tags.each do |tag_id|
       tag = Tag.find(tag_id)
          @bookmark.tags << tag
      end
    end

    if params[:tag]
      tag_ids = params[:tag].map {|tag| tag.to_i}
      tags = tag_ids.select do |tag|
        !@bookmark.tags.ids.include?(tag)
      end
      tags.each do |id|
        tag = Tag.find(id)
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
    if params[:newTag]
      @bookmark.tags << Tag.find(params[:newTag][:id])
      params[:bookmark] = {url: @bookmark.url, title: @bookmark.title}
    elsif params[:tag]
      @bookmark.tags = []
      tag_ids = params[:tag].map {|tag| tag.to_i}
      tag_ids.each do |id|
        tag = Tag.find(id)
        @bookmark.tags << tag
      end
    else      
      @bookmark.tags = []
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
      @bookmark = current_user.bookmarks.find(params[:id])
    end

    def bookmark_params
      params.require(:bookmark).permit(:url, :screenshot, :title )
    end
end
