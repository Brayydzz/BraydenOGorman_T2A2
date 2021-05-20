class PagesController < ApplicationController
  def home
    @equipment_listings = EquipmentListing.order(created_at: :desc)
  end

end
