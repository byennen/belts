class Admin::BeltsController < Admin::ApplicationController
  before_action :set_belt, only: [:show, :edit, :update, :destroy]

  # GET /belts
  # GET /belts.json
  def index
    @belts = Belt.all.order("id asc")
  end

  # GET /belts/1
  # GET /belts/1.json
  def show
  end

  # GET /belts/new
  def new
    @belt = Belt.new
  end

  # GET /belts/1/edit
  def edit
  end

  # POST /belts
  # POST /belts.json
  def create
    @belt = Belt.new(belt_params)

    respond_to do |format|
      if @belt.save
        format.html { redirect_to admin_belts_path, notice: 'Belt was successfully created.' }
        format.json { render action: 'show', status: :created, location: @belt }
      else
        format.html { render action: 'new' }
        format.json { render json: @belt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /belts/1
  # PATCH/PUT /belts/1.json
  def update
    respond_to do |format|
      if @belt.update(belt_params)
        format.html { redirect_to admin_belts_path, notice: 'Belt was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @belt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /belts/1
  # DELETE /belts/1.json
  def destroy
    @belt.destroy
    respond_to do |format|
      format.html { redirect_to admin_belts_path }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_belt
    @belt = Belt.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def belt_params
    params.require(:belt).permit(:name, :hex_color, :image, :belt_pattern_image, :style_id, :price)
  end
end
