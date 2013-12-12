class Admin::OrdersController < Admin::ApplicationController
  before_action :set_order, only: [:show]

  def index
    @report = OrderReport.new(params[:order_report])
    @assets = @report.assets.page(params[:page])
  end

  def show
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_order
    @order = Order.find(params[:id])
  end
end
