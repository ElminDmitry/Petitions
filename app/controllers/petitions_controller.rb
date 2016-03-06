class PetitionsController < ApplicationController
  #before_action :signed_in_user
  # GET /petitions
  def index
    @petitions = Petition.all
  end

  # GET /petitions/1
  def show
    @petition = Petition.find(params[:id])
  end

  # PUT /petitions/1
  def update
    petition = Petition.find(params[:id])
    petition.update(params)
    redirect_to petition_path(petition)
  end

  # POST /petitions
  def create
    @petition = current_user.petitions.build(petition_params)
    if @petition.save
      flash[:success] = "Петиция добавлена"
      redirect_to root_url
    else
      render new_petition_path
    end

    # petition = Petition.create(petition_params)
    # redirect_to petition_path(petition)
  end

  # GET /petitions/new
  def new
    @petition = Petition.new
  end

  def petitions
    @petitions = Petition.first(10)
  end

  private

  def petition_params
    params.require(:petition).permit(:title, :text)
  end
end