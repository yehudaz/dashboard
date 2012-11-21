class RecordsController < ApplicationController
  def index
    @records = Record.all
  end

  def new
    @record = Record.new
  end

  def create
    @record = Record.new(params[:record])
    if @record.save
      redirect_to records_url, :notice => "Successfully created record."
    else
      render :action => 'new'
    end
  end
end
