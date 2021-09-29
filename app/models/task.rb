class Task < ApplicationRecord
  
  belongs_to :user
  belongs_to :category, optional: true
  validates_presence_of :user
  validates :title, length: { maximum: 30 }
  validates :description, length: { maximum: 250 }

end
