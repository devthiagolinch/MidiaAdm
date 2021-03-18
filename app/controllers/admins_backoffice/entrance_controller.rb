class AdminsBackoffice::EntranceController < AdminsBackofficeController
    before_action :set_entrances, only: [:edit, :update, :destroy]

    def index
        @entrances = Entrance.all.order(:updated_at)
    end

    def new
        @entrance = Entrance.new
    end

    def create
        @entrance = Entrance.new
        if @entrance.save
            redirect_to admins_backoffice_entrance_index_path
        else
            render :new
        end
    end

    def edit
        @entrance = Entrance.find(params[:id])
    end

    def update
        if @entrance.update(params_entrance)
            redirect_to admins_backoffice_entrance_index_path
        else
            render :edit
        end
    end

    def destroy
        if @entrance.destroy
            redirect_to admins_backoffice_entrance_index_path
        else
            render :index
        end
    end

    private

    def params_entrance
        params.require(:entrance).permit(:id, :description, :date_of_entrance, :value, :type_of_entrance)
    end

    def set_entrances
        @entrance = Entrance.find(params[:id])
    end
end
