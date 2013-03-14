class Version < ActiveRecord::Base
  attr_accessible :code_review_insights, :description, :git_hash, :grade, :name, :passed_tests, :patches_deployed, :rbp_open_issues, :tests_coverage

  def insights
    code_review_insights.split(';')
  end

  def patches
    patches_deployed.split(';')
  end

end
