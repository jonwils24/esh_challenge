class StaticPagesController < ApplicationController
  def root
    @schools = School.all
  end
end