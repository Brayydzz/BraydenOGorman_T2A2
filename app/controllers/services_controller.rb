class ServicesController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    before_action :set_service, only: [:show, :update, :edit, :destroy]
    before_action :check_auth, except: [:index, :show, :new, :create]

    def index 
        @services = Service.order(:created_at).page(params[:page])
    end

    def show 
        
    end

    def new
        @service = Service.new
    end

    def create
        @service = Service.new(service_params)
        @service.user = current_user
        if @service.save
            redirect_to @service
        else
            flash.now[:errors] = @service.errors.full_messages
            render action: 'new'
        end
    end

    def destroy
        @service.destroy
        redirect_to services_path
    end

    def edit

    end

    def update
        if @service.update(service_params)
            redirect_to @service
        else
            flash.now[:errors] = @service.errors.full_messages
            render action: 'edit'
        end
    end

    private

    def check_auth
        authorize @service
    end

    def service_params 
        params.require(:service).permit(:id, :user_id, :title, :description, :price, :location, :photo)
    end

    def set_service
        @service = Service.find(params[:id])
    end

end
