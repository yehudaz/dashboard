class VersionsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @versions = Version.where(:done => true)
  end

  # new is the current version
  def new
    @version = Version.find_by_done(false) || Version.create
    collect_data
  end

  def create
    @version = Version.last
    @version.update_attributes(params['version'])
    collect_data
    if @version.save
      redirect_to versions_url, :notice => "Successfully created version"
    else
      render :action => 'new'
    end
  end

  def edit
    @version = Version.find(params[:id])
    collect_data unless @version.done?
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
      format.html { redirect_to versions_url }
      format.json { head :ok }
    end
  end

  def close
    @version = Version.last
    dont_close = @version.nil? || @version.name.blank? || @version.description.blank?
    @version.update_attribute(:done, true) unless dont_close

    respond_to do |format|
      format.html { redirect_to versions_url }
      format.json { head :ok }
    end
  end

  private

  def collect_data
		@version.coverage_diff = @version.coverage_diff.nil? ? 0 : tests_coverage - @version.tests_coverage
    @version.git_hash = git_hash
    @version.tests_coverage = tests_coverage
    @version.passed_tests = passed_tests
    @version.total_tests = total_tests
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

  def total_tests
    record = Record.where(the_type: "Total Tests").last
    record.nil? ? 0 : record.value
  end

  def rbp
    record = Record.where(the_type: "RBP").last
    record.nil? ? 0 : record.value
  end

end
