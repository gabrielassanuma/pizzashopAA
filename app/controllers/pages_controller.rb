class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  def home

  end

  def track
  end

  def pizzas
    @pizzas = Product.where(subclass: "pizza")
  end

  def drinks
    @drinks = Product.where(subclass: "drink")
  end

  def desserts
    @desserts = Product.where(subclass: "desserts")
  end
end
