class DashboardController < ApplicationController
  def index
    @type = params[:type] || Record.first._type
    @records = Record.where('_type' => @type).select("created_at, value")
  end
end
