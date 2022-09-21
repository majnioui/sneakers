module ApplicationHelper
  def current_order
    # Use Find by id to avoid potential errors
    # Find a cart from user.orders
    if current_user.present?
    current_user.cart || current_user.new_cart
    else
      nil
    end
  end
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end 
end