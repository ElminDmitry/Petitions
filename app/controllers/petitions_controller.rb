class PetitionsController < ApplicationController
  #before_action :signed_in_user
  # GET /petitions
  def index
    @petitions = Petition.all
    @petitions = @petitions.where(user: current_user) if params[:my]
  end

  # GET /petitions/1
  def show
    @petition = Petition.find(params[:id])
  end

  # PUT /petitions/1
  def update
    petition = current_user.petitions.find(params[:id])
    if petition.expired?(petition.id)
      redirect_to petition, notice: 'Срок голосования петиции прошел'
    else
      petition.update(petition_params)
      redirect_to petition, notice: 'Петиция обновлена'
    end
  end

  # POST /petitions
  def create
    @petition = current_user.petitions.create(petition_params)
    if @petition.save
      flash[:success] = "Петиция добавлена"
      redirect_to petitions_path(my: true)
    else
      render new_petition_path
    end
  end

  # GET /petitions/new
  def new
    @petition = current_user.petitions.new
  end

  def petitions
    @petitions = Petition.first(10)
  end

  def edit
    byebug
    @petition = current_user.petitions.find(params[:id])
  end

  def destroy
    @petition = Petition.find_by(id: params[:id])
    @petition.destroy
    flash[:success] = "Петиция удалена"
    params[:my] = true
    redirect_to petitions_path(my: true)
  end

  private

  def petition_params
    params.require(:petition).permit(:title, :text)
  end
end