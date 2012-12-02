class ImagesProductsController < ApplicationController
  # GET /images_products
  # GET /images_products.json
  def index
    @images_products = ImagesProduct.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @images_products }
    end
  end

  # GET /images_products/1
  # GET /images_products/1.json
  def show
    @images_product = ImagesProduct.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @images_product }
    end
  end

  # GET /images_products/new
  # GET /images_products/new.json
  def new
    @images_product = ImagesProduct.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @images_product }
    end
  end

  # GET /images_products/1/edit
  def edit
    @images_product = ImagesProduct.find(params[:id])
  end

  # POST /images_products
  # POST /images_products.json
  def create
    @images_product = ImagesProduct.new(params[:images_product])

    respond_to do |format|
      if @images_product.save
        format.html { redirect_to @images_product, notice: 'Images product was successfully created.' }
        format.json { render json: @images_product, status: :created, location: @images_product }
      else
        format.html { render action: "new" }
        format.json { render json: @images_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /images_products/1
  # PUT /images_products/1.json
  def update
    @images_product = ImagesProduct.find(params[:id])

    respond_to do |format|
      if @images_product.update_attributes(params[:images_product])
        format.html { redirect_to @images_product, notice: 'Images product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @images_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /images_products/1
  # DELETE /images_products/1.json
  def destroy
    @images_product = ImagesProduct.find(params[:id])
    @images_product.destroy

    respond_to do |format|
      format.html { redirect_to images_products_url }
      format.json { head :no_content }
    end
  end
end
