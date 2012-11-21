class Record < ActiveRecord::Base
  attr_accessible :_type, :value

  def to_a
    [created_at.utc.to_i, value]
  end
end
