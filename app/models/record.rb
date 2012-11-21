class Record < ActiveRecord::Base
  attr_accessible :_type, :value, :created_at

  validates_presence_of :value, :_type, :on => :create, :message => "can't be blank"

  def to_a
    [created_at.to_i, value]
  end
end
