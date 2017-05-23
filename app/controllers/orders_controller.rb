# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :set_order, only: %i[show edit update destroy]

  def index
    @q = Order.ransack(params[:q])
    @orders = @q.result.page(params[:page]).per(params[:per])
  end

  def show; end

  def new
    @order = Order.new
    @order.product_orders.build
  end

  def edit; end

  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to orders_url, notice: t('orders.success') }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to orders_url, notice: t('orders.success') }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: t('orders.destroy') }
      format.json { head :no_content }
    end
  end

  def delete_selected
    Order.destroy(params[:orders])
    respond_to do |format|
      format.html { redirect_to orders_url, notice: t('orders.destroy') }
      format.json { head :no_content }
    end
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:client_id, :date, :discount, product_orders_attributes: %i[id product_id order_id quantity])
  end
end
