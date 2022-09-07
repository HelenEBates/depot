class StoreController < ApplicationController
  def index
    @products = Product.order(:title)
    session[:counter].nil? ? session[:counter] = 1 : session[:counter] += 1
    @count = session[:counter]
  end
end
