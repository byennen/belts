class Admin::BucklesController < Admin::ApplicationController
  before_action :set_buckle, only: [:show, :edit, :update, :destroy]

  # GET /buckles
  # GET /buckles.json
  def index
    @buckles = Buckle.all.order("id asc")
  end

  # GET /buckles/1
  # GET /buckles/1.json
  def show
  end

  # GET /buckles/new
  def new
    @buckle = Buckle.new
  end

  # GET /buckles/1/edit
  def edit
  end

  # POST /buckles
  # POST /buckles.json
  def create
    @buckle = Buckle.new(buckle_params)

    respond_to do |format|
      if @buckle.save
        format.html { redirect_to admin_buckles_path, notice: 'Buckle was successfully created.' }
        format.json { render action: 'show', status: :created, location: @buckle }
      else
        format.html { render action: 'new' }
        format.json { render json: @buckle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /buckles/1
  # PATCH/PUT /buckles/1.json
  def update
    respond_to do |format|
      if @buckle.update(buckle_params)
        format.html { redirect_to admin_buckles_path, notice: 'Buckle was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @buckle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /buckles/1
  # DELETE /buckles/1.json
  def destroy
    @buckle.destroy
    respond_to do |format|
      format.html { redirect_to admin_buckles_path }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_buckle
    @buckle = Buckle.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def buckle_params
    params.require(:buckle).permit(:name, :hex_color, :image, :style_id)
  end
end
