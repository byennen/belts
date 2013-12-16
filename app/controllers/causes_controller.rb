class CausesController < ApplicationController
  def index
    @causes = Cause.active
  end

  def show    
    @cause = Cause.find_by(slug: params[:cause])
    raise ActiveRecord::RecordNotFound if @cause.nil?
    @belt_url = Belt.find_by_name(@cause[:belt_color]).image.url
    @buckle_url = Buckle.find_by_name(@cause[:buckle_color]).image.url
    @other = Cause.active.where("#{Cause.table_name}.id <> #{@cause.id}").to_a
  end
end
