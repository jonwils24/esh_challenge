class SchoolPurchase < ActiveRecord::Base
  after_touch :set_portion_of_average
  validates :ben, presence: true
  
  belongs_to(
    :school,
    primary_key: :ben,
    foreign_key: :ben,
    class_name: "School"
  )
  
  
  
  def calculate_mbs
    measure = self.measure
    case measure
    when "k"
      mbs = self.bandwidth / 1000.00
    when "g"
      mbs = self.bandwidth * 1000.00
    when "t"
      mbs = self.bandwidth * 1000000.00
    else
      mbs = self.bandwidth * 1.00
    end
    mbs
  end 
  
  def average_cost_per_purchase
    self.cost / self.calculate_mbs
  end
  
  def same_ben_purchases
    SchoolPurchase.all.select { |purchase| purchase.ben == self.ben }
  end
  
  def num_of_same_ben_purchases
    self.same_ben_purchases.length
  end
  
  def same_ben_total_cost
    total_cost = 0
    self.same_ben_purchases.each do |purchase|
      total_cost += purchase.average_cost_per_purchase
    end
    total_cost
  end
  
  def same_ben_average_cost
    self.same_ben_total_cost / self.num_of_same_ben_purchases
  end
  
  def set_portion_of_average
    self.portion_of_average ||= self.same_ben_average_cost / self.num_of_same_ben_purchases
  end
end
