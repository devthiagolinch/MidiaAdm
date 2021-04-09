class AdminsBackoffice::FinanceResumeController < AdminsBackofficeController
  def index
    @entrance = Entrance.last
    @sum_of_spendings = Spending.total
    @sum_of_entrances = Entrance.total
  end
end
