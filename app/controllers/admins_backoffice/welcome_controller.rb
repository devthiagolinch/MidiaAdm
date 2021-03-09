class AdminsBackoffice::WelcomeController < AdminsBackofficeController
  def index
    @users = User.all.includes(:user_profile)
  end
end
