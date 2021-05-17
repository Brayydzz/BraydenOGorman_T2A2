class ServicesController < ApplicationController

    before_action :set_service, only: [:show, :update, :edit, :destroy]

    def index 
        @services = Service.all
    end

    def show 

    end

    def new
        @service = Service.new
    end

    def create
        @service = Service.new(service_params)
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

    def service_params 
        params.require(:service).permit(:id, :user_id, :title, :description, :price, :location)
    end

    def set_service
        @service = Service.find(params[:id])
    end

end
