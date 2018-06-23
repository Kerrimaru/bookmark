class TagsController < ApplicationController

  def index
    #binding.pry
    bm = current_user.bookmarks
    #checks = params[:bookmark][:tag]
    #@bookmarks = bm.collect {|bm| bm.tags.where(tag: params[:tag])}.flatten
    # @bookmarks = bm.each do |bm|
    #   bm.tags.where(tag: params[:tag])
    # end
    @bookmarks = Tag.find(params[:tag].first).bookmarks.where(user: current_user)
    #@bookmarks = Tag.where(params[:tag]).bookmarks.where(user: current_user)
    # @bookmarks = bookmarks.each do |bookmark|
    #   bookmark.where(:tags == params[:bookmark][:tag])
    # tags = current_user.bookmarks.collect {|bm| bm.tags}.flatten
    # @tags = tags.collect {|tag| tag.tag}.uniq  
    @tags = current_user.bookmarks.collect {|bm| bm.tags}.flatten.uniq

    render 'bookmarks/index'
  end

  # def create
  #   @tag = Tag.new(params[:tag])

  #   respond_to do |format|
  #     if @tag.save
  #       format.html { redirect_to @tag, notice: 'tag was successfully created.' }
  #       format.json { render :show, status: :created, location: @tag }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @tag.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

end
# bm.each do |bm|
#  if bm.tags.include?(params[:bookmark][:tag])
#  puts bm
#   end
#  end