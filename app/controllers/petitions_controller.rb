class PetitionsController < ApplicationController
  before_filter :authorize, only: [:new, :create]
  # GET /petitions
  def index
    @petitions = Petition.all
    @petitions = Petition.search(params[:search]).order("created_at DESC") if params[:search]
    @petitions = @petitions.where(user: current_user) if params[:my]
  end

  # GET /petitions/1
  def show
    @petition = Petition.find(params[:id])
  end

  def edit
    @petition = current_user.petitions.find(params[:id])
  end

  # POST /petitions
  def create
    @petition = current_user.petitions.create(petition_params)
    if @petition.save
      flash[:success] = "Петиция добавлена"
      UserMailer.create_petition(@petition).deliver_later
      redirect_to petitions_path(my: true)
    else
      render new_petition_path
    end
  end

  # GET /petitions/new
  def new
    @petition = current_user.petitions.new
  end

  def search
    @search = Petition.search(params[:q])
    @petitions = @search.result(distinct: true)
  end

  def petitions
    @petitions = Petition.order(created_at: :desc).limit(10)
  end

  # PUT /petitions/1
  def update
    petition = current_user.petitions.find(params[:id])
    # if petition.expired?(petition.id)
    #   redirect_to petition, notice: 'Срок голосования петиции прошел'
    # else
    petition.update(petition_params)
    redirect_to petition, notice: 'Петиция обновлена'
    # end
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
    params.require(:petition).permit(:title, :text, :captcha, :captcha_key, genre_ids:[])
  end
end