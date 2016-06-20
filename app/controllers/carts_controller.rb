class CartsController < ApplicationController
  def show
    @cart = Cart.find(params[:id])
  end
  def checkout
    cart = Cart.find(params[:id])
    cart.checkout
    redirect_to cart
  end
end
