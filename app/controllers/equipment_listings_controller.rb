class EquipmentListingsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    before_action :set_equipment, only: [:update, :show, :destroy, :edit]
    before_action :set_condition_item_type, only: [:new, :edit, :create, :update, :index]
    before_action :check_auth, except: [:index, :show, :new, :create]

    rescue_from ActiveSupport::MessageVerifier::InvalidSignature, with: :too_many_bad_images

    def index
        @count = EquipmentListing.count
        if params[:item_type_id]
            @equipment_listings = EquipmentListing.where(item_type_id: params[:item_type_id]).order(:created_at).page(params[:page])
            @category = ItemType.where(id: params[:item_type_id])
        else
            @equipment_listings = EquipmentListing.order(:created_at).page(params[:page])
        end
    end

    def show

        session[:listing_id] = @equipment_listing.user.id
    end

    def new
        @equipment_listing = EquipmentListing.new

        #Build will create and store an empty photo object in memory.
        3.times {@equipment_listing.photos.build}

    end

    def create
        @equipment_listing = EquipmentListing.new(equipment_params)
        @equipment_listing.user = current_user
        if @equipment_listing.save
            redirect_to @equipment_listing
        else
            flash.now[:errors] = @equipment_listing.errors.full_messages
            render action: 'new'
        end

    end

    def edit 

    end

    def update
        if @equipment_listing.update(equipment_params)
            redirect_to @equipment_listing
        else
            flash.now[:errors] = @equipment_listing.errors.full_messages
            render action: 'edit'
        end
    end

    def destroy
        @equipment_listing.destroy
        redirect_to equipment_listings_path
    end
    
    private

    def too_many_bad_images
        if params[:action] == "create"
            redirect_to new_equipment_listing_path, alert: "Too many images"
        elsif params[:action] == "update"
            redirect_to edit_equipment_listing_path, alert: "Too many images"
        end
    end

    def check_auth
        authorize @equipment_listing
    end

    def set_condition_item_type
        @condition = Condition.all
        @item_type = ItemType.all
    end

    def set_equipment
        @equipment_listing = EquipmentListing.find(params[:id])
    end

    def equipment_params
        params.require(:equipment_listing).permit(:id, :user_id, :item_type_id, :title, :price, :description, :condition_id, :address, photos: [])
    end

end
