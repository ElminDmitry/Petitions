class HomeController < ApplicationController
  def index
    @pititions = current_user.petitions.build if signed_in?
  end
  # def home
  #   if signed_in?
  #     @pitition  = current_user.petitions.build
  #     @feed_items = current_user.feed.paginate(page: params[:page])
  #   end
  # end
end
