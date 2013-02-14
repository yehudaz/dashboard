class DashboardController < ApplicationController

  before_filter :authenticate_user!

  def index
    @the_type = (Record.count > 0) ?
        (params[:the_type] || Record.first.the_type) : "NA"
    @records = Record.where('LOWER(the_type)=?', @the_type.downcase).order("created_at").select("created_at, value")
  end
end
