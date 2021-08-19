class OrdersController < ApplicationController
  def create
    @order = Order.new(order_params)
    @order.user_id = current_user.id
    @order.status = :pending

    if @order.save
      flash[:notice] = 'Pedido criado com sucesso'
      RestaurantNotifierJob.perform_later(current_user.id)
    else
      flash[:error] = 'Fudeu...'
    end
    redirect_to root_path
  end

  private

  def order_params
    params.permit(:product_id)
  end
end
