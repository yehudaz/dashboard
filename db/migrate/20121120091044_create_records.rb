class CreateRecords < ActiveRecord::Migration
  def self.up
    create_table :records do |t|
      t.string :_type, null: false
      t.float :value, null: false
      t.datetime :created_at, default: Time.now
    end
  end

  def self.down
    drop_table :records
  end
end
