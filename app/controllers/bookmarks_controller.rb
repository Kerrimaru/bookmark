class BookmarksController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_bookmark, only: [:show, :edit, :update, :destroy]
                :authenticate_user!
  
  # GET /bookmarks
  # GET /bookmarks.json
  def index
    #binding.pry
    @tags = current_user.bookmarks.collect {|bm| bm.tags}.flatten.uniq      
    if params[:created_at]
      #binding.pry
      if params[:created_at] == "oldest"
        @bookmarks = current_user.bookmarks.order(created_at: :asc)
      else @bookmarks = current_user.bookmarks.order(created_at: :desc)
      end
    elsif params[:tag]
      output = []
      tag_ids = params[:tag]
      #binding.pry
      tag_ids.each do |tag_id|
        tag = Tag.find(tag_id)
        current_user.bookmarks.each do |bm|
          if bm.tags.include?(tag)
            output << bm
          end
        end
        @bookmarks = output.flatten.uniq
      end

    elsif params[:created_at]

    else
      @bookmarks = current_user.bookmarks.paginate(page: params[:page]).search(params[:search]).order(created_at: :desc)
    end
  end

  # GET /bookmarks/1
  # GET /bookmarks/1.json
  def show
  end

  # GET /bookmarks/new
  def new
    @bookmark = Bookmark.new
  end

  # GET /bookmarks/1/edit
  def edit
  end

  # POST /bookmarks
  # POST /bookmarks.json
  def create
    #binding.pry
    @bookmark = current_user.bookmarks.new(bookmark_params)
    if params[:bookmark][:tags]
      tags = params[:bookmark][:tags].select do |tag|
        !tag.id.empty?
      end
      tags.each do |tag_id|
       tag = Tag.find(tag_id)
          @bookmark.tags << tag
      end
    end
    # @bookmark = current_user.bookmarks.new(bookmark_params)
    # tags = params[:bookmark][:tags]
    # tags.each do |tag_id|
    #   if tag_id != ''
    #     tag = Tag.find(tag_id)
    #     @bookmark.tags << tag
    #   end
    # end

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

  # PATCH/PUT /bookmarks/1
  # PATCH/PUT /bookmarks/1.json
  def update
    if params[:bookmark][:tags]
      tags = params[:bookmark][:tags].select do |tag|
        !tag.id.empty?
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

  # DELETE /bookmarks/1
  # DELETE /bookmarks/1.json
  def destroy
    @bookmark.destroy
    respond_to do |format|
      format.html { redirect_to bookmarks_url, notice: 'Bookmark was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bookmark
      @bookmark = Bookmark.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bookmark_params
      params.require(:bookmark).permit(:url, :screenshot, :title, :image)
    end
end
