class Admin::CouponsController < Admin::ApplicationController

  def index
    @report = CouponReport.new(params[:coupon_report])
    @assets = @report.assets.page(params[:page])
  end

  def new
    @coupon = Coupon.new    
  end

  def create
    @coupon = Coupon.new params.require(:coupon).permit(:code, :frequency, :discount_type, :discount_percentage, :discount, :start_date, :end_date, :status)
    if @coupon.save
      redirect_to new_admin_coupon_path, notice: "Coupon saved successfully."
    else      
      render action: :new
    end
  end

  def edit
    @coupon = Coupon.find params[:id]
  end

  def update
    @coupon = Coupon.find params[:id]
    if @coupon.update params.require(:coupon).permit(:code, :frequency, :discount_type, :discount_percentage, :discount, :start_date, :end_date, :status)
      redirect_to admin_coupons_path, notice: "Coupon saved successfully."    
    else
      render action: :edit
    end
  end

  def destroy
    @coupon = Coupon.find params[:id]
    if @coupon.destroy
      redirect_to admin_coupons_path, notice: "Coupon deleted successfully"
    else
      redirect_to admin_coupons_path, notice: "Error in deleting coupon"
    end
  end

end