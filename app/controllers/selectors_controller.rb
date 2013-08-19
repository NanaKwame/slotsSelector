require 'rubygems'
require 'json'

class SelectorsController < ApplicationController
  # GET /selectors
  # GET /selectors.json
  def index
    @selectors = Selector.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @selectors }
    end
  end

  # GET /selectors/1
  # GET /selectors/1.json
  def show
    @selector = Selector.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @selector }
    end
  end

  # GET /selectors/new
  # GET /selectors/new.json
  def new
    @selector = Selector.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @selector }
    end
  end

  # GET /selectors/1/edit
  def edit
    @selector = Selector.find(params[:id])
  end

  # POST /selectors
  # POST /selectors.json
  def create
    @selector = Selector.new(params[:selector])

    respond_to do |format|
      if @selector.save
        format.html { redirect_to @selector, notice: 'Selector was successfully created.' }
        format.json { render json: @selector, status: :created, location: @selector }
      else
        format.html { render action: "new" }
        format.json { render json: @selector.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /selectors/1
  # PUT /selectors/1.json
  def update
    @selector = Selector.find(params[:id])

    respond_to do |format|
      if @selector.update_attributes(params[:selector])
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @selector.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /selectors/1
  # DELETE /selectors/1.json
  def destroy
    @selector = Selector.find(params[:id])
    @selector.destroy

    respond_to do |format|
      format.html { redirect_to selectors_url }
      format.json { head :no_content }
    end
  end
end
