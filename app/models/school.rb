class School < ActiveRecord::Base
  after_initialize :set_average_cost
  
  validates :name, :ben, presence: true
  
  has_many(
    :purchases,
    primary_key: :ben,
    foreign_key: :ben,
    class_name: "SchoolPurchase"
  )
  
  attr_accessor :average_cost
  
  def average_cost_per_mb
    result = 0
    self.purchases.each do |purchase|
      result += purchase.average_cost_per_purchase
    end
    result
  end
  
  def set_average_cost
    self.average_cost ||= self.average_cost_per_mb
  end
end
