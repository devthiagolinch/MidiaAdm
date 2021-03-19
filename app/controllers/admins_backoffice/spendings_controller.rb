class AdminsBackoffice::SpendingsController < AdminsBackofficeController
  before_action :set_spending, only: [:edit, :update, :destroy]
  def index
    @spendings = Spending.all
  end

  def new
    @spending = Spending.new
  end

  def create
    @spending = Spending.new(params_spending)
    if @spending.save()
      redirect_to admins_backoffice_spendings_index_path
    else
      render :new
    end
  end

  def edit
    @spending = Spending.find(params[:id])
  end

  def update
    if @spending.update(params_spending)
      redirect_to admins_backoffice_spendings_index_path
    else
      render :edit
    end
  end

  def destroy
    if @spending.destroy
      redirect_to admins_backoffice_spendings_index_path
    else
      render :edit
    end
  end

  private

  def params_spending
    params.require(:spending).permit(:description, :value, :date)
  end

  def set_spending
    @spending = Spending.find(params[:id])
  end
end
