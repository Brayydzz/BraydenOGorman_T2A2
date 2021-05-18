class EquipmentListingsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    before_action :set_equipment, only: [:update, :show, :destroy, :edit]
    before_action :set_condition_item_type, only: [:new, :edit, :create, :update, :index]
    before_action :check_auth, except: [:index, :show, :new, :create]

    
    def index
        if params[:item_type_id]
            @equipment_listings = EquipmentListing.where(item_type_id: params[:item_type_id])
        else
            @equipment_listings = EquipmentListing.all
        end
        
    end

    def show

    end

    def new
        @equipment_listing = EquipmentListing.new
        3.times {@equipment_listing.photos.build}

    end

    def create
        @equipment_listing = EquipmentListing.new(equipment_params)
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
