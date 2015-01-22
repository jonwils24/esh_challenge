class StaticPagesController < ApplicationController
  def root
    @schools = School.all
    @purchases = SchoolPurchase.all.each {|purchase| purchase.set_portion_of_average}
  end
end