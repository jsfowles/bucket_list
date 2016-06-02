class Item < ActiveRecord::Base
  belongs_to :list

  before_update :set_completed_date

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  def set_completed_date
  	self.completed_date = Date.today if self.completed && self.completed_date.nil? 
  end
end
