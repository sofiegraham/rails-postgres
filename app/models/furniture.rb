class Furniture < ApplicationRecord
  validates :name, presence: true
  validate :must_have_resident

  def must_have_resident #If furniture is in house, house must have residents
    if self.house_id && House.find(self.house_id).residents.size < 1
      self.errors[:house_id] << "must have resident"
    end
  end

  belongs_to :house,
    primary_key: :id,
    foreign_key: :house_id,
    class_name: House,
    optional: true

end