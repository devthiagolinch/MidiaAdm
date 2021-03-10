class AdminsBackoffice::WelcomeController < AdminsBackofficeController
  def index
    @users = User.all.includes(:user_profile)
    @schedule = Schedule.all.order(:day)
  end
end
