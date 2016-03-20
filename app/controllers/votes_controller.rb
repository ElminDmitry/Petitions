class VotesController < ApplicationController

  def create
    vote = current_user.votes.create(permitt_params)
    @petition = Petition.find(vote[:petition_id])
    redirect_to petitions_index_path, notice: 'Спасибо за поддержку!'
  end

  def permitt_params
    params.permit(:petition_id)
  end

end