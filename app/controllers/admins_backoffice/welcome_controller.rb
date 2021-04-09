class AdminsBackoffice::WelcomeController < AdminsBackofficeController
  def index
    @profile = UserProfile.all
    @schedule = Schedule.all
    @entrance = Entrance.last
    @sum_of_spendings = Spending.total
    @sum_of_entrances = Entrance.total
    @current_balance = Entrance.total - Spending.total  
    @total_users = AdminStatistic.find_by_event(AdminStatistic::EVENTS[:total_users]).value
  end
end
