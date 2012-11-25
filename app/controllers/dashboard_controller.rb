class DashboardController < ApplicationController
  def index
    @the_type = params[:the_type] || Record.first.the_type
    @records = Record.where('the_type' => @type).order("created_at").select("created_at, value")
  end
end
