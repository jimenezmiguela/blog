# Create an OrdersController.  Add methods for index, show, new, edit, create, update, and destroy.
# These will be similar to the methods in other controllers you have seen.
# bin/rails generate controller orders

class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  def index
    @orders = Order.all #Load Page from data
  end

  def show
    # Show one specific page object
    # @order = Order.find(params[:id])
    # render text: params[:id]
  end

  def new
    @order = Order.new
  end

  def edit
    # @order = Order.find(params[:id])
  end

  def create
    # Code must check whether the @order.save operation succeeded.
    # If it doesn't, the user does not know what happened.
    # The save operation may fail if the user didn't enter a required parameter,
    # or if validations fail for the record being created.
    # So that is the reason for the if statement.
    # the save operation returns true if the save worked, and false if it didn't,
    # and if it fails the errors are set

    @order = Order.new(order_params)
    if @order.save
      flash.notice = "The order record was created successfully."
      redirect_to @order
    else
      flash.now.alert = @order.errors.full_messages.to_sentence
      render :new
    end

  end

  def update
    # @order = Order.find(params[:id])
    if @order.update(order_params)
      flash.notice = "The order record was updated successfully."
      redirect_to @order
    else
      flash.now.alert = @order.errors.full_messages.to_sentence
      render :edit
    end

  end

    def destroy
      # @order = Order.find(params[:id])
      @order.destroy
      redirect_to orders_path
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:product_name, :product_count, :customer_id)
    end

    def catch_not_found(e)
      Rails.logger.debug("We had a not found exception.")
      flash.alert = e.to_s
      redirect_to order_path
    end

  end
