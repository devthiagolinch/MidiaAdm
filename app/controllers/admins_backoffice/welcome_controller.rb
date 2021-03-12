class AdminsBackoffice::WelcomeController < AdminsBackofficeController
  def index
    @users = User.includes(:user_profile).all
    @schedule = Schedule.all.order(:day)
  end
end
