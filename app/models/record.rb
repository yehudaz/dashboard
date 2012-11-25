class Record < ActiveRecord::Base
  attr_accessible :the_type, :value

  validates_presence_of :value, :the_type, :on => :create, :message => "can't be blank"

  def to_a
    [to_date, value]
  end

  private

  def to_date
    created_at.utc.to_i*1000
  end
end
