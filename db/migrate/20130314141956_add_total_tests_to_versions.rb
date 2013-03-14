class AddTotalTestsToVersions < ActiveRecord::Migration
  def change
    add_column :versions, :total_tests, :integer
  end
end
