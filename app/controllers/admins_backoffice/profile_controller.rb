class AdminsBackoffice::ProfileController < AdminsBackofficeController
    before_action :set_admin
    before_action :verify_password, only: [:update]

    def edit
    end

    def update
        if @admin.update(params_admin)
            bypass_sign_in(@admin) # no update
            redirect_to admins_backoffice_welcome_index_path, notice: "Usuário
            atualizado com sucesso!"
        else
            render :index
        end
    end

    private

    def set_admin
        @admin = Admin.find(current_admin.id)
    end

    def params_admin
        params.require(:admin).permit(:first_name, :last_name, :email,
        :password, :password_confirmation)
    end
        
    def verify_password
        if params[:admin][:password].blank? &&
        params[:admin][:password_confirmation].blank?
        params[:admin].extract!(:password, :password_confirmation)
        end
    end
end
