class ArtistsController < ApplicationController
  before_action :set_artist, only: [:show, :destroy]

  def index
    @artists = Artist.all
  end

  def show; end

  def new
    @artist = Artist.new
  end

  def destroy
    @artist.destroy
    redirect_to root_path, notice: "Artist is successfully removed"
  end

  private

  def set_artist
    @artist = Artist.find(params[:id])
  end

end
