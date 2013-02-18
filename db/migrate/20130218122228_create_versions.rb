class CreateVersions < ActiveRecord::Migration
  def change
    create_table :versions do |t|
      t.string :name
      t.text :description
      t.text :code_review_insights
      t.text :patched_deployed
      t.double :tests_coverage
      t.integer :passed_tests
      t.integer :rbp_open_issues
      t.string :git_hash
      t.double :grade

      t.timestamps
    end
  end
end
