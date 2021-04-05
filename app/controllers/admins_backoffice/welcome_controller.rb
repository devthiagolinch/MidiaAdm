class AdminsBackoffice::WelcomeController < AdminsBackofficeController
  def index
    @profile = UserProfile.all
    @schedule = Schedule.all
    @entrance = Entrance.last
    @total_users = AdminStatistic.find_by_event(AdminStatistic::EVENTS[:total_users]).value
  end
end
