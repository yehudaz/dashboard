class Version < ActiveRecord::Base
  attr_accessible :code_review_insights, :description, :git_hash, :grade, :name, :passed_tests, :patches_deployed, :rbp_open_issues, :tests_coverage
end
