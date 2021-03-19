class AdminsBackoffice::EntrancesController < AdminsBackofficeController
  before_action :set_entrance, only: [:edit, :update, :destroy]
  def index
    @entrances = Entrance.all
  end
  
  def new
    @entrance = Entrance.new
  end

  def create
    @entrance = Entrance.new(params_entrance)
    if @entrance.save()
      redirect_to admins_backoffice_entrances_index_path
    else
      render :new
    end
  end

  def edit
    @entrance = Entrance.find(params[:id])
  end

  def update
    if @entrance.update(params_entrance)
      redirect_to admins_backoffice_entrances_index_path
    else
      render :edit
    end
  end

  def destroy
    if @entrance.destroy
      redirect_to admins_backoffice_entrances_index_path
    else
      render :edit
    end
  end

  private

  def params_entrance
    params.require(:entrance).permit(:description, :value, :date_of_entrance, :type_of_entrance)
  end

  def set_entrance
    @entrance = Entrance.find(params[:id])
  end
end
