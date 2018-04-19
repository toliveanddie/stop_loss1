class WelcomeController < ApplicationController
  def index
    @stocks = Stock.all
  end
end
