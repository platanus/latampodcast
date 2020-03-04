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
    new_params = podcast_params
    new_params[:user_id] = current_user.id
    puts new_params
    @podcast = Podcast.create(new_params)

    redirect_to root_path
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
    is_permited = is_admin? || current_user

    redirect_to root_path unless is_permited
  end

  private

  def set_podcast
    @podcast = Podcast.find(params[:id])
  end

  def podcast_params
    params.require(:podcast).permit(:title, :url, :description, :image_slug)
  end
end
