class AdminsBackoffice::SchedulesController < AdminsBackofficeController
  before_action :set_schedule, only: [:edit, :update, :destroy]
  def index
    @schedules = Schedule.all
  end

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(params_schedule)
    if @schedule.save()
      redirect_to admins_backoffice_schedules_index_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @schedule.update(params_schedule)
      redirect_to admins_backoffice_schedules_index_path
    else
      render :edit
    end
  end

  def destroy
    if @schedule.destroy
      redirect_to admins_backoffice_schedules_index_path
    else
      render :edit
    end
  end

  private

  def params_schedule
    params.require(:schedule).permit(:day, :morning_tranmission, :morning_files, :night_transmission, :night_files, :night_sound)
  end

  def set_schedule
    @schedule = Schedule.find(params[:id])
  end
end
