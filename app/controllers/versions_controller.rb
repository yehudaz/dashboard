class VersionsController < ApplicationController

  def index
    @versions = Version.all
  end

  # new is the current version
  def new
    @version = Version.find_by_done(false) || Version.new
    @insights = @version.code_review_insights.split(';')
    @patches = @version.patches_deployed.split(';')
    collect_data
  end

  def create
    @version = Version.new(params)
    if @version.save
      redirect_to versions_url, :notice => "Successfully created version"
    else
      render :action => 'new'
    end
  end

  def edit
    @version = Version.find(params[:id])
    @insights = @version.code_review_insights.split(';')
    @patches = @version.patches_deployed.split(';')
  end

  def update
    @version = Version.find(params[:id])
    @version.code_review_insights = params['insights']
    @version.patches_deployed = params['patches']
    respond_to do |format|
      if @version.save
        format.json { head :no_content }
      else
        format.json { render json: @version.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @version = Version.find(params[:id])
    @version.destroy

    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private

  def collect_data

  end

end
