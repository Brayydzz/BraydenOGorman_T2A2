class EquipmentListingsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    before_action :set_equipment, only: [:update, :show, :destroy, :edit]
    before_action :set_condition_item_type, only: [:new, :edit, :create, :update, :index]
    before_action :check_auth, except: [:index, :show, :new, :create]

    rescue_from ActiveSupport::MessageVerifier::InvalidSignature, with: :too_many_bad_images

    def index
        #@count allows me to show the total amount of listings on the index page
        @count = EquipmentListing.count

        # If the user selects a category via the '_category' form this will change the params to show the item_type_id. 
        # If the params have the Item type in them it will show all listings with the corrosponding item_type_Id, otherwise show all listings
        # .page allows pagination through kaminari gem
        if params[:item_type_id]
            @equipment_listings = EquipmentListing.where(item_type_id: params[:item_type_id]).order(created_at: :desc).page(params[:page])

            #Allows me to fetch the category name to from the current params to show on the page
            @category = ItemType.where(id: params[:item_type_id])
        else
            @equipment_listings = EquipmentListing.order(created_at: :desc).page(params[:page])
        end
    end

    def show
        # Session is stored in memory whenever a user views a listing. Session is used to allocate the recipient_Id when a user wants to send a message to the owner of the listing
        session[:listing_id] = @equipment_listing.user.id
    end

    def new
        @equipment_listing = EquipmentListing.new

        #Build will create and store an empty photo object in memory.
        3.times {@equipment_listing.photos.build}

    end

    def create
        #@equipment_listing.user stores the current user in memory to assign the user_id automatically when a listing is created

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
        # Fills edit form with current params and provides error handling
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
        # Method is used to provide error handling when users are uploading images to a listing
    def too_many_bad_images
        if params[:action] == "create"
            redirect_to new_equipment_listing_path, alert: "Too many images"
        elsif params[:action] == "update"
            redirect_to edit_equipment_listing_path, alert: "Too many images"
        end
    end

    # Checks the authorization of a user through Pundit
    def check_auth
        authorize @equipment_listing
    end

    # Method is used to give the users Item types and conditions to select from when creating/editing a listing
    def set_condition_item_type
        @condition = Condition.all
        @item_type = ItemType.all
    end
    # Sets the current equipment listing for each action assigned by before_action helper for user to view
    def set_equipment
        @equipment_listing = EquipmentListing.find(params[:id])
    end
        # Sanitizes input for permitted params
    def equipment_params
        params.require(:equipment_listing).permit(:id, :user_id, :item_type_id, :title, :price, :description, :condition_id, :address, photos: [])
    end

end
