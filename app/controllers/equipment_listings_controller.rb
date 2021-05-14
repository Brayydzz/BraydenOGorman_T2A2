class EquipmentListingsController < ApplicationController
    
    before_action :set_equipment, only: [:update, :show, :destroy, :edit]
    before_action :set_condition_item_type, only: [:new, :edit, :create, :update]

    def index
        @equimpent_listings = EquipmentListing.all
    end

    def show

    end

    def new
        @equimpent_listing = EquipmentListing.new
    end

    def create
        @equimpent_listing = EquipmentListing.new(equipment_params)
        if @equimpent_listing.save
            redirect_to @equipment_listing
        else
            flash.now[:errors] = @equimpent_listing.errors.full_messages
            render action: 'new'
        end

    end
    
    private

    def set_condition_item_type
        @condition = Condition.all
        @item_type = ItemType.all
    end

    def set_equipment
        @equimpent_listing = EquipmentListing.find(params[:id])
    end

    def equipment_params
        params.require(:equipment_listing).permit(:user_id, :item_type_id, :title, :price, :description, :condition_id, :address_id)
    end

end
