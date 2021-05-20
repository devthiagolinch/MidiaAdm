class AdminsBackoffice::FinanceResumeController < AdminsBackofficeController
  def index
    @entrance = Entrance.all
    @entrance_last = Entrance.last
    @sum_of_spendings = Spending.total
    @sum_of_entrances = Entrance.total
    @current_balance = Entrance.total - Spending.total  
  end
end
