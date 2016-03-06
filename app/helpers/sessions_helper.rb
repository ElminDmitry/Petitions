module SessionsHelper

  def signed_in?
    !current_user.nil?
  end

  def current_user?(user)
    user == current_user
  end

  # def signed_in_user
  #   unless signed_in?
  #     store_location
  #     redirect_to signin_url, notice: "Please sign in."
  #   end
  # end
end

