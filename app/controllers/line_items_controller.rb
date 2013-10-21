class LineItemsController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:create]
  before_action :set_line_item, only: [:update, :destroy]

  # POST /line_items
  # POST /line_items.json
  def create
    if params[:belt_id]
      belt = Belt.find(params[:belt_id])
      buckle = Buckle.find(params[:buckle_id])
    else
      belt = Belt.find_by_image(params[:belt_url].match(/upload\/(.*)/)[1])
      buckle = Buckle.find_by_image(params[:buckle_url].match(/upload\/(.*)/)[1])
    end

    @line_item = @cart.add_product(belt.id, buckle.id)

    respond_to do |format|
      if @line_item.save
        format.html { redirect_to root_url }
        format.js { @current_item = @line_item }
        format.json { render action: 'show', status: :created, location: @line_item }
      else
        format.html { render action: 'new' }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /line_items/1
  # PATCH/PUT /line_items/1.json
  def update
    respond_to do |format|
      if @line_item.update(line_item_params)
        format.html { redirect_to @line_item, notice: 'Line item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /line_items/1
  # DELETE /line_items/1.json
  def destroy
    @line_item.destroy
    respond_to do |format|
      format.html { redirect_to line_items_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_item
      @line_item = LineItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def line_item_params
      params.require(:line_item).permit(:buckle_id, :belt_id)
    end
end
