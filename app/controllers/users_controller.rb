class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    unless simple_captcha_valid?
      flash[:failure] = "Код с картинки не верный!"
      render "new" and return
    end
    if @user.save && simple_captcha_valid?
      flash[:success] = "Спасибо за регистрацию!"
      redirect_to root_url
    else
      render "new"
    end
  end

  def show
    #@user = User.find(params[:id])
    #@petitions = Petition.find(params[:id])
    #@petitions = @user.petitions.paginate(page: params[:page])
    #current_user.petitions.title
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end