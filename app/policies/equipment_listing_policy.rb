class EquipmentListingPolicy < ApplicationPolicy

  def index 
    true
  end

  def new 
    user_is_owner_of_record? || (user && user.has_role?(:admin))
  end

  def create 
    user_is_owner_of_record? || (user && user.has_role?(:admin))
  end

  def edit?
    user_is_owner_of_record? || (user && user.has_role?(:admin))
  end

  def update?
    user_is_owner_of_record?
  end

  def destroy? 
    user_is_owner_of_record? || (user && user.has_role?(:admin))
  end

  private

  def user_is_owner_of_record?
    user && user.id == record.user_id 
  end
end
