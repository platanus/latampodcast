class PodcastsController < ApplicationController
  before_action :admin_user, only: [:edit]

  def show
    podcast = Podcast.find_by_id(params[:id]);
    if (podcast)
      redirect_to podcast.url
    else
      redirect_to root_path, :notice => "Podcast not found"
    end
  end

  def edit

  end

  def admin_user
    unless isAdmin? || current_user and current_user.id == params[:id]
      flash[:danger] = "You have not permission to do this."
      redirect_to root_path
    end
  end


end
