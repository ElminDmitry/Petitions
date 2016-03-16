class VotesController < ApplicationController

  def create
    petition = User.find(current_user)
    petition.votes.create(permitt_params)
    flash[:success] = 'Спасибо за поддержку!'
    redirect_to petitions_index_path
  end

  def permitt_params
    params.permit(:petition_id)
  end

end