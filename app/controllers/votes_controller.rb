class VotesController < ApplicationController

  def create
    @petition = Petition.find(params[:format])
    @petition.votes.create(current_user[:user_id])
    # @votes = Vote.find_by_petition_id(:petition_id)
    # @vote = votes.create(votes_params)
    redirect_to petitions_index_path
  end

end