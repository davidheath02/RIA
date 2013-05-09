class UserIndustriesController < ApplicationController
  #autocomplete :user_industry, :industry_name
  #helper_method :sort_column, :sort_direction
  
  # GET /user_industries
  # GET /user_industries.json
  def index
    @user_industries = UserIndustry.search(params[ :search ]).all 
     
     #order(sort_column + " " + sort_direction).paginate(:per_page => 20, :page => params[:page])
        respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @user_industries }
    end
  end



  # GET /user_industries/1
  # GET /user_industries/1.json
  def show
    @user_industry = UserIndustry.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user_industry }
    end
  end

  # GET /user_industries/new
  # GET /user_industries/new.json
  def new
    @user_industry = UserIndustry.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user_industry }
    end
  end

  # GET /user_industries/1/edit
  def edit
    @user_industry = UserIndustry.find(params[:id])
  end

  # POST /user_industries
  # POST /user_industries.json
  def create
    @user_industry = UserIndustry.new(params[:user_industry])

    respond_to do |format|
      if @user_industry.save
        format.html { redirect_to @user_industry, notice: 'User industry was successfully created.' }
        format.json { render json: @user_industry, status: :created, location: @user_industry }
      else
        format.html { render action: "new" }
        format.json { render json: @user_industry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /user_industries/1
  # PUT /user_industries/1.json
  def update
    @user_industry = UserIndustry.find(params[:id])

    respond_to do |format|
      if @user_industry.update_attributes(params[:user_industry])
        format.html { redirect_to @user_industry, notice: 'User industry was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user_industry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_industries/1
  # DELETE /user_industries/1.json
  def destroy
    @user_industry = UserIndustry.find(params[:id])
    @user_industry.destroy

    respond_to do |format|
      format.html { redirect_to user_industries_url }
      format.json { head :no_content }
    end
  end
   def search
    @user_industries = UserIndustry.search(params[ :search ]).all 
     
     #order(sort_column + " " + sort_direction).paginate(:per_page => 20, :page => params[:page])
        respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @user_industries }
    end
  end
  
  
  def industry_stats
    @total = UserIndustry.count :all
    @count_industries = UserIndustry.select("DISTINCT(industry_name)").count
    
    @users =  UserIndustry.select("DISTINCT(user_id)")
    
    
    @top5_industries_us = UserIndustry.find_by_sql("SELECT 
                                        UI.INDUSTRY_NAME
                                        ,L.COUNTRY_CODE
                                        ,COUNT(UI.USER_ID)
                                      FROM USER_INDUSTRIES UI
                                      INNER JOIN LOCATIONS L ON UI.USER_ID = L.USER_ID
                                      WHERE COUNTRY_CODE NOT IN('MISSING_CODE')
                                      AND COUNTRY_CODE IN('us')
                                      GROUP BY UI.INDUSTRY_NAME, L.COUNTRY_CODE
                                      ORDER BY COUNT(UI.USER_ID) DESC
                                      LIMIT 5")
                                      
                          
                         
  
     respond_to do |format|
        format.html
        format.json { render :json => {:user_industry => @top5_industries_us
                                        #, 
                                       #:user_industry => @top5_industries_gb,
                                       #:user_industry => @top5_industries_il
                                        }}
    end
  end
  
  def gb_industry
      @top5_industries_gb = UserIndustry.find_by_sql("SELECT 
                                        UI.INDUSTRY_NAME
                                        ,L.COUNTRY_CODE
                                        ,COUNT(UI.USER_ID)
                                      FROM USER_INDUSTRIES UI
                                      INNER JOIN LOCATIONS L ON UI.USER_ID = L.USER_ID
                                      WHERE COUNTRY_CODE NOT IN('MISSING_CODE')
                                      AND COUNTRY_CODE IN('gb')
                                      GROUP BY UI.INDUSTRY_NAME, L.COUNTRY_CODE
                                      ORDER BY COUNT(UI.USER_ID) DESC
                                      LIMIT 5")
                                      
      respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @top5_industries_gb }
    end
 end
  
def il_industry
@top5_industries_il = UserIndustry.find_by_sql("SELECT 
                                        UI.INDUSTRY_NAME
                                        ,L.COUNTRY_CODE
                                        ,COUNT(UI.USER_ID)
                                      FROM USER_INDUSTRIES UI
                                      INNER JOIN LOCATIONS L ON UI.USER_ID = L.USER_ID
                                      WHERE COUNTRY_CODE NOT IN('MISSING_CODE')
                                      AND COUNTRY_CODE IN('il')
                                      GROUP BY UI.INDUSTRY_NAME, L.COUNTRY_CODE
                                      ORDER BY COUNT(UI.USER_ID) DESC
                                      LIMIT 5")
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @top5_industries_il }
    end
                           

end

end