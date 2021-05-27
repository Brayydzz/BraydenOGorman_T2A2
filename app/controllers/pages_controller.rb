class PagesController < ApplicationController

  # Allows home page to view the latest listings
  def home
    @equipment_listings = EquipmentListing.order(created_at: :desc)
  end

end
