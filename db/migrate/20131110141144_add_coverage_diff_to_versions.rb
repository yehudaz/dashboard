class AddCoverageDiffToVersions < ActiveRecord::Migration
  def change
    add_column :versions, :coverage_diff, :float
  end
end
