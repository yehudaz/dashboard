class CreateVersions < ActiveRecord::Migration
  def change
    create_table :versions do |t|
      t.boolean :done, :null => false, default: false
      t.string :name
      t.text :description
      t.text :code_review_insights, :null => false, default: ''
      t.text :patches_deployed, :null => false, default: ''
      t.float :tests_coverage
      t.integer :passed_tests
      t.integer :rbp_open_issues
      t.string :git_hash
      t.float :grade

      t.timestamps
    end
  end
end
