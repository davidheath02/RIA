class CoSizesController < ApplicationController
  # GET /co_sizes
  # GET /co_sizes.json
  def index
    @co_sizes = CoSize.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @co_sizes }
    end
  end

  # GET /co_sizes/1
  # GET /co_sizes/1.json
  def show
    @co_size = CoSize.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @co_size }
    end
  end

  # GET /co_sizes/new
  # GET /co_sizes/new.json
  def new
    @co_size = CoSize.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @co_size }
    end
  end

  # GET /co_sizes/1/edit
  def edit
    @co_size = CoSize.find(params[:id])
  end

  # POST /co_sizes
  # POST /co_sizes.json
  def create
    @co_size = CoSize.new(params[:co_size])

    respond_to do |format|
      if @co_size.save
        format.html { redirect_to @co_size, notice: 'Co size was successfully created.' }
        format.json { render json: @co_size, status: :created, location: @co_size }
      else
        format.html { render action: "new" }
        format.json { render json: @co_size.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /co_sizes/1
  # PUT /co_sizes/1.json
  def update
    @co_size = CoSize.find(params[:id])

    respond_to do |format|
      if @co_size.update_attributes(params[:co_size])
        format.html { redirect_to @co_size, notice: 'Co size was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @co_size.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /co_sizes/1
  # DELETE /co_sizes/1.json
  def destroy
    @co_size = CoSize.find(params[:id])
    @co_size.destroy

    respond_to do |format|
      format.html { redirect_to co_sizes_url }
      format.json { head :no_content }
    end
  end
  def size_stats
    
     @total = CoSize.count :all
     @sample = CoSize.select("DISTINCT(read_at)")   
       
     @users_per_cosize = @sample.count(:group => "no_employees")
     respond_to do |format|
        format.html
        format.json { render json: @users_per_cosize }
    end
   
    
    end
     
  end
    
  

