class BookmarksController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_bookmark, only: [:show, :edit, :update, :destroy]
                :authenticate_user!
  
  def index
    @tags = current_user.bookmarks.collect {|bm| bm.tags}.flatten.uniq
    if params[:tag]
      output = []
      tag_ids = params[:tag]
      tag_ids.each do |tag_id|
        current_user.bookmarks.each do |bm|
          if bm.tag_ids.include?(tag_id.to_i)
            output << bm
          end
        end
        if params[:created_at] == "oldest"
          @bookmarks = output.flatten.uniq.sort_by{|bookmark| bookmark.created_at}
        else
          @bookmarks = output.flatten.uniq.sort_by{|bookmark| bookmark.created_at}.reverse
        end
      end
    else
      @bookmarks = current_user.bookmarks.paginate(page: params[:page]).search(params[:search]).order(created_at: :desc)
    end
  end

  def show
  end

  def new
    @bookmark = Bookmark.new
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
    #@bookmark = current_user.bookmarks.new(bookmark_params)

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
    # tags = params[:bookmark][:tags]
    # tags.each do |tag_id|
    #   if tag_id != ''
    #     tag = Tag.find(tag_id)
    #     @bookmark.tags << tag 
    #   end
    # end
    
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
