class VersionsController < ApplicationController
  before_filter :authenticate_user!

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
    @version = Version.new(params['version'])
    collect_data
    @version.done = true
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
    @version.update_attributes(params['version'])
    collect_data
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
    @version.git_hash = git_hash
    @version.tests_coverage = tests_coverage
    @version.passed_tests = passed_tests
    @version.rbp_open_issues = rbp
  end

  def git_hash
    begin
      github = Github.new login:'yehuda@conduit.com', password:'Aa123456'
      commits = github.repos.commits.all 'ConduitArch', 'air'
      commits.first['sha']
    rescue
      'no data'
    end
  end

  def tests_coverage
    record = Record.where(the_type: "Coverage").last
    record.nil? ? 0 : record.value
  end

  def passed_tests
    record = Record.where(the_type: "Passed Tests").last
    record.nil? ? 0 : record.value
  end

  def rbp
    record = Record.where(the_type: "RBP").last
    record.nil? ? 0 : record.value
  end

end
