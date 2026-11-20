class SongsController < ApplicationController
  def search
    search_keyword = params[:name] || params[:query]

    @songs = Song.where("title LIKE ?", "%#{search_keyword}%")
  end

  def index
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)

    if @song.save
      redirect_to songs_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @song = Song.find(params[:id])
  end

  private

  def song_params
    params.require(:song).permit(:title, :year, :category)
  end
end
