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
   
     #@count_myself = CoSize.count :all, :conditions => ["no_employees like ?", "Myself Only"]
     #@count_ten = CoSize.count :all, :conditions => ["no_employees like ?", "1-10 employees"]
     #@count_fifty = CoSize.count :all, :conditions => ["no_employees like ?", "11-50 employees"]
     #@count_200 = CoSize.count :all, :conditions => ["no_employees like ?", "51-200 employees"]
     #@count_500 = CoSize.count :all, :conditions => ["no_employees like ?", "201-500 employees"]
     #@count_1000 = CoSize.count :all, :conditions => ["no_employees like ?", "501-1000 employees"]
     #@count_5000 = CoSize.count :all, :conditions => ["no_employees like ?", "1001-5000 employees"]
     #@count_10000 = CoSize.count :all, :conditions => ["no_employees like ?", "5001-10,000 employees"]
     #@count_10000plus = CoSize.count :all, :conditions => ["no_employees like ?", "10,001+ employees"]
     #@count_none = CoSize.count :all, :conditions => ["no_employees like ?", ""]
     
     #@types = CoSize.find(params[:no_employees]) 
     #@no_employees = CoSize.no_employees
     
     #.map{|t| t.activity}.uniq
     #respond_to do |format|
      #  format.html
       # format.json { 
        #  render json: 
         #   {
          #    total: @total,
           #   myself: @count_myself,
            #  ten: @count_ten,
             # fifty: @count_fifty,
              #twohund: @count_200,
              #fivehund: @count_500,
              #thousand: @count_1000,
              #fivethousand: @count_5000,
              #tenthousand: @count_10000,
              #tenthousand_plus: @count_10000plus,
              #missing: @count_none}}
              
            
        
        
    end
     
  end
    
  

