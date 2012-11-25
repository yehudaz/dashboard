class CreateRecords < ActiveRecord::Migration
  def self.up
    create_table :records do |t|
      t.string :the_type, null: false
      t.float :value, null: false
      t.timestamps
    end
  end

  def self.down
    drop_table :records
  end
end
