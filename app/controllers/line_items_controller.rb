class LineItemsController < ApplicationController

  def create
    if !!current_user
      if !!current_user.current_cart
        if line_item = current_user.current_cart.line_items.find_by(item_id: params[:item_id])
          line_item.update(quantity: line_item.quantity + 1)
        else
          current_user.current_cart.items << Item.find(params[:item_id])
        end
      else
        new_cart = current_user.carts.create
        new_cart.items << Item.find(params[:item_id])
        current_user.update(current_cart_id: new_cart.id)
      end
      redirect_to cart_path(current_user.current_cart) and return
    end
    redirect_to store_path
  end

end
