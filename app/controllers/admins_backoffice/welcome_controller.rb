class AdminsBackoffice::WelcomeController < AdminsBackofficeController
  def index
    @profile = UserProfile.all
    @schedule = Schedule.all
  end
end
