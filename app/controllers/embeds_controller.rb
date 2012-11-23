class EmbedsController < ApplicationController
  # GET /embeds
  # GET /embeds.json
  layout "embed", :only => :show

  def index
    @embeds = Embed.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @embeds }
    end
  end

  # GET /embeds/1
  # GET /embeds/1.json
  def show

    @embed = Embed.find(params[:id]) if params[:id]
    @embed = Embed.find_by_code(params[:code]) if params[:code]

    respond_to do |format|
      format.html
      format.json { render json: @embed }
    end
  end

  # GET /embeds/new
  # GET /embeds/new.json
  def new
    @embed = Embed.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @embed }
    end
  end

  # GET /embeds/1/edit
  def edit
    @embed = Embed.find(params[:id])
  end

  # POST /embeds
  # POST /embeds.json
  def create
    @embed = Embed.new(params[:embed])

    respond_to do |format|
      if @embed.save
        format.html { redirect_to @embed, notice: 'Embed was successfully created.' }
        format.json { render json: @embed, status: :created, location: @embed }
      else
        format.html { render action: "new" }
        format.json { render json: @embed.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /embeds/1
  # PUT /embeds/1.json
  def update
    @embed = Embed.find(params[:id])

    respond_to do |format|
      if @embed.update_attributes(params[:embed])
        format.html { redirect_to @embed, notice: 'Embed was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @embed.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /embeds/1
  # DELETE /embeds/1.json
  def destroy
    @embed = Embed.find(params[:id])
    @embed.destroy

    respond_to do |format|
      format.html { redirect_to embeds_url }
      format.json { head :no_content }
    end
  end
end
