class AdminsBackoffice::ScheduleController < AdminsBackofficeController
    before_action :set_schedule, only: [:edit, :update, :destroy]

    def index
        @schedule = Schedule.all.order(:day)
    end
    def edit
        @schedule = Schedule.find(params[:id])
    end

    def update
        if @schedule.update(params_schedule)
            redirect_to admins_backoffice_schedule_index_path
        else
            render :edit
        end
    end

    def new
        @schedule = Schedule.new
    end

    def create
        @schedule = Schedule.new(params_schedule)
        if @schedule.save()
            redirect_to admins_backoffice_schedule_index_path
        else
            render :new
        end
    end

    def destroy
        if @schedule.destroy
            redirect_to admins_backoffice_schedule_index_path
        else
            render :index
        end
    end

    private

    def params_schedule
        params.require(:schedule).permit(:id, :day, :morning_files, :morning_tranmission, :night_transmission, :night_sound, :night_files)
    end

    def set_schedule
        @schedule = Schedule.find(params[:id])
    end
end
