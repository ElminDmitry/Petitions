class VotesController < ApplicationController


  def create
    # @petition = Petition.find(params[:format])
    # @petition.votes.create(current_user[:user_id])
    vote = current_user.votes.create(permitted_params)
    redirect_to petitions_index_path, notice: 'Спасибо за поддержку!'
    #redirect_to petitions_index_path
  end

  def permitted_params
    params.permit(:petition_id)
  end

end