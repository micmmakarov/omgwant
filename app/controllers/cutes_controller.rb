class CutesController < ApplicationController
  # GET /cutes
  # GET /cutes.json
  def index
    @cutes = Cute.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cutes }
    end
  end

  # GET /cutes/1
  # GET /cutes/1.json
  def show
    @cute = Cute.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cute }
    end
  end

  # GET /cutes/new
  # GET /cutes/new.json
  def new
    @cute = Cute.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cute }
    end
  end

  # GET /cutes/1/edit
  def edit
    @cute = Cute.find(params[:id])
  end

  # POST /cutes
  # POST /cutes.json
  def create
    @cute = Cute.new(params[:cute])

    respond_to do |format|
      if @cute.save
        format.html { redirect_to @cute, notice: 'Cute was successfully created.' }
        format.json { render json: @cute, status: :created, location: @cute }
      else
        format.html { render action: "new" }
        format.json { render json: @cute.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cutes/1
  # PUT /cutes/1.json
  def update
    @cute = Cute.find(params[:id])

    respond_to do |format|
      if @cute.update_attributes(params[:cute])
        format.html { redirect_to @cute, notice: 'Cute was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cute.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cutes/1
  # DELETE /cutes/1.json
  def destroy
    @cute = Cute.find(params[:id])
    @cute.destroy

    respond_to do |format|
      format.html { redirect_to cutes_url }
      format.json { head :no_content }
    end
  end
end
