class DashboardController < ApplicationController
  def index
    @type = params[:type] || Record.first._type
    @records = Record.where('_type' => @type).order("created_at").select("created_at, value")
  end
end
