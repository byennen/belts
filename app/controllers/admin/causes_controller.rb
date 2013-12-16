class Admin::CausesController < Admin::ApplicationController

  def index
    @report = CauseReport.new(params[:cause_report])
    @assets = @report.assets.page(params[:page])
  end

  def new
    @cause = Cause.new
  end

  def create
    @cause = Cause.new params.require(:cause).permit(:title, :slug, :buckle_color, :belt_color, :image, :status, :content)
    if @cause.save
      redirect_to admin_causes_path, notice: "Cause saved successfully."
    else      
      render action: :new
    end
  end

  def edit
    @cause = Cause.find params[:id]
  end

  def update
    @cause = Cause.find params[:id]
    if @cause.update params.require(:cause).permit(:title, :slug, :buckle_color, :belt_color, :image, :status, :content)
      redirect_to admin_causes_path, notice: "Cause saved successfully."    
    else
      render action: :edit
    end
  end

  def destroy
    @cause = Cause.find params[:id]
    if @cause.destroy
      redirect_to admin_causes_path, notice: "Cause deleted successfully"
    else
      redirect_to admin_causes_path, notice: "Error in deleting coupon"
    end
  end


end