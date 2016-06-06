class List < ActiveRecord::Base
  belongs_to :user
  has_many :items, dependent: :destroy
  acts_as_commontable
end
