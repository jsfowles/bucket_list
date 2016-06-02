class Item < ActiveRecord::Base
  belongs_to :list

  before_update :set_completed_date

  def set_completed_date
  	self.completed_date = Date.today if self.completed && self.completed_date.nil? 
  end
end
