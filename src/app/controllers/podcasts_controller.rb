class PodcastsController < ApplicationController
  before_action :set_podcast, only: %i[edit show update destroy]
  before_action :admin_user, only: %i[create new destroy update]

  def show
    podcast = Podcast.find_by_id(params[:id])
    if podcast
      redirect_to podcast.url
    else
      redirect_to root_path, notice: 'Podcast not found'
    end
  end

  def new
    @podcast = Podcast.new
  end

  def create
    @podcast = Podcast.new(podcast_params)
  end

  def update
    if @podcast.update(podcast_params)
      flash[:success] = 'Podcast was updated successfully'
      redirect_to podcast_path(@podcast)
    else
      render 'edit'
    end
  end

  def destroy
    if @podcast
      @podcast.destroy
      flash[:danger] = 'Podcast was destroyed'
    end
    redirect_to podcasts_path
  end

  def admin_user
    is_permitted = isAdmin? || current_user && current_user.id == params[:id]
    return nil unless is_permitted

    flash[:danger] = 'You have not permission to do this.'
    redirect_to root_path
  end

  private

  def set_podcast
    @podcast = Podcast.find(params[:id])
  end

  def podcast_params
    params.require(:podcast).permit(:title, :url)
  end
end
