class Api::ProductsController < ApplicationController

  def search
    search_string = params[:search]
    response = HTTParty.get("http://api.shopstyle.com/action/apiSearch?pid=uid7444-8563962-34&fts=#{search_string}&min=0&count=30&format=json")
    render json: response["products"]
  end

end
