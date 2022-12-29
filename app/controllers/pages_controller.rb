class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  def home

  end

  def track
  end

  def pizzas
  
  end


end
