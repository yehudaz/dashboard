class DashboardController < ApplicationController
  def index
    @the_type = (Record. count > 0) ?
        (params[:the_type] || Record.first.the_type) : "NA"
    @records = Record.where('the_type' => @the_type).order("created_at").select("created_at, value")
  end
end
