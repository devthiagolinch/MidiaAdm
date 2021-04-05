class AdminsBackoffice::FinanceResumeController < AdminsBackofficeController
  def index
    @entrance = Entrance.last
  end
end
