class LocationsController < ApplicationController
  # GET /locations
  # GET /locations.json
  def index
    @locations = Location.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @locations }
    end
  end

  # GET /locations/1
  # GET /locations/1.json
  def show
    @location = Location.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @location }
    end
  end

  # GET /locations/new
  # GET /locations/new.json
  def new
    @location = Location.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @location }
    end
  end

  # GET /locations/1/edit
  def edit
    @location = Location.find(params[:id])
  end

  # POST /locations
  # POST /locations.json
  def create
    @location = Location.new(params[:location])

    respond_to do |format|
      if @location.save
        format.html { redirect_to @location, notice: 'Location was successfully created.' }
        format.json { render json: @location, status: :created, location: @location }
      else
        format.html { render action: "new" }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /locations/1
  # PUT /locations/1.json
  def update
    @location = Location.find(params[:id])

    respond_to do |format|
      if @location.update_attributes(params[:location])
        format.html { redirect_to @location, notice: 'Location was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /locations/1
  # DELETE /locations/1.json
  def destroy
    @location = Location.find(params[:id])
    @location.destroy

    respond_to do |format|
      format.html { redirect_to locations_url }
      format.json { head :no_content }
    end
  end
  def location_stats
    
   @count_cities = Location.select("DISTINCT(country_name)").count
   @count_countries = Location.select("DISTINCT(country_code)").count
 
   
   #@users_per_location = Location.select(%q{country_name, count(DISTINCT(user_id)) GROUP BY country_name})
                                 
   end
   def map
       @users = Location.select('DISTINCT(user_id)')
       @top6_countries = @users.where('country_code = ? OR country_code = ? 
                            OR country_code = ? OR country_code = ?
                            OR country_code = ? OR country_code = ?', 
                            "us","fi", "fr", "cn", "il", "gb")
       
         #(:select => "user_id", :conditions => "country_code = us")
   
       @users_per_location = @top6_countries.count(:group => "country_code")
   
    respond_to do |format|
        format.html
        format.json { render json: @users_per_location }
    end
   end
end
