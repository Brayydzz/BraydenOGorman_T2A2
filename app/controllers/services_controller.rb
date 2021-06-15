class ServicesController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    before_action :set_service, only: [:show, :update, :edit, :destroy]
    before_action :check_auth, except: [:index, :show, :new, :create]

    def index 
        # Stores all service listings in descending order of time created. .page allows pagination through kaminari gem
        @services = Service.order(created_at: :desc).page(params[:page])
    end

    def show 
        # Session is stored in memory whenever a user views a listing. Session is used to allocate the recipient_Id when a user wants to send a message to the owner of the listing
        session[:listing_id] = @service.user_id
    end

    def new
        @service = Service.new
    end


    #@service.user stores the current user in memory to assign the user_id automatically when a listing is created
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
        # Fills edit form with current params and provides error handling
        if @service.update(service_params)
            redirect_to @service
        else
            flash.now[:errors] = @service.errors.full_messages
            render action: 'edit'
        end
    end

    private
    # Checks the authorization of a user through Pundit
    def check_auth
        authorize @service
    end
    # Sanitizes input for permitted params
    def service_params 
        params.require(:service).permit(:id, :user_id, :title, :description, :price, :location, :photo)
    end

    # Sets the current service listing for each action assigned by before_action helper for user to view
    def set_service
        @service = Service.find(params[:id])
    end

end
