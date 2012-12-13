class Api::ProductsController < ApplicationController

  def search
    search_string = params[:search]
    response = HTTParty.get("http://api.shopstyle.com/action/apiSearch?pid=uid7444-8563962-34&fts=#{search_string}&min=0&count=30&format=json")
    render json: response["products"]
  end

  def index
    image = Image.find(params[:id])
    products = params[:id].present? ? image.products : Product.all
    render json: products.to_json
  end

  def show
    product = Product.find(params[:id])
    render json: product.to_json
  end

  def create
    product = Product.new(params[:product])
    product.image.user = current_user
    product.save!
    render json: product.to_json
  end

  def update
    product = Product.find(params[:id])
    product.save! if product.image.user = current_user
    render json: product.to_json(:methods => api_methods)
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy if product.image.user = current_user
    render json: product
  end

end
