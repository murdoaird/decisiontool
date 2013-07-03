class DecisionsController < ApplicationController
  before_filter :authenticate_user!
  # GET /decisions
  # GET /decisions.json
  def index
    @decisions = Decision.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @decisions }
    end
  end

  # GET /decisions/1
  # GET /decisions/1.json
  def show
    @decision = Decision.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @decision }
    end
  end

  # GET /decisions/new
  # GET /decisions/new.json
  def new
    @decision = Decision.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @decision }
    end
  end

  # GET /decisions/1/edit
  def edit
    @decision = Decision.find(params[:id])
  end

  # POST /decisions
  # POST /decisions.json
  def create
    @decision = Decision.new(params[:decision])

    respond_to do |format|
      if @decision.save
        format.html { redirect_to @decision, notice: 'Decision was successfully created.' }
        format.json { render json: @decision, status: :created, location: @decision }
      else
        format.html { render action: "new" }
        format.json { render json: @decision.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /decisions/1
  # PUT /decisions/1.json
  def update
    @decision = Decision.find(params[:id])

    respond_to do |format|
      if @decision.update_attributes(params[:decision])
        format.html { redirect_to @decision, notice: 'Decision was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @decision.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /decisions/1
  # DELETE /decisions/1.json
  def destroy
    @decision = Decision.find(params[:id])
    @decision.destroy

    respond_to do |format|
      format.html { redirect_to decisions_url }
      format.json { head :no_content }
    end
  end
  
  def results  
    Rails.logger.warn "call sum_elements"
    #sum_elements 
    decision_sums = sum_elements2
    if decision_sums.size > 0 
      normalise_values(decision_sums)
      normalise_averages
    else
      respond_to do |format|
        format.html { redirect_to decisions_url, notice: 'There were no results to view - have you run the survey yet?' }
      end 
    end 
  end 

  def normalise_averages ()
    @decision = Decision.find(params[:id])
    #@calc_avg = Calculation.where(:decision_id => params[:id]).group(:element_id).average('normalised')
    @calc_avg = Calculation.find_by_sql("select row_id, avg(CAST(normalised AS decimal)) " + 
                                          "from calculations " + 
                                          "where decision_id = " + params[:id] + " " +
                                          "group by row_id " + 
                                          "order by row_id ASC")
    @element = Element.where(:decision_id => @decision).order("decision_id ASC")
    
    data_vals = Array.new(@calc_avg.count-1)
    data_labels = Array.new(@calc_avg.count-1)
    i_loop = 0
    for avg in @calc_avg
      if avg.row_id != nil
        data_labels[i_loop] = @element[i_loop ].name
        data_vals[i_loop] = (avg.avg.to_f*100).to_f.round(2)
        Rails.logger.warn Time.now.to_s + " normalise_averages " + data_vals[i_loop].to_s
      end 
      i_loop += 1
    end
    
    @h_results = LazyHighCharts::HighChart.new('graph') do |f|       
      f.options[:chart][:defaultSeriesType] = "bar"      
      f.options[:title][:text] = @decision.title
      f.legend(:reversed => 'true')
      f.xAxis(:categories=> data_labels)
      f.yAxis(:min=> 0, :max=> 100, :title => { :text => "Percentage" })
      f.plotOptions(:series=> {:stacking => 'normal'})
      f.series(:name=>'Importance', color: '#95BBD7', :data=> data_vals) 
    end
    
  end
    
  def normalise_values (decision_sums)
    @calc_results = Calculation.where(:decision_id => params[:id]).order("element_id ASC")
    
    for resultX in @calc_results
      Rails.logger.warn Time.now.to_s + " normalise for row id =" + resultX.row_id.to_s + " : normalise_values=" + (resultX.value.to_f / decision_sums[resultX.element_id]).round(2).to_s
      resultX.normalised = (resultX.value.to_f / decision_sums[resultX.element_id]).round(2)
      if !resultX.save
          format.html { redirect_to home_url, notice: 'An error occured saving the survey(2) - we are sorry.' }          
      end 
    end
  end

=begin  
  def sum_elements

    @calculation = Calculation.where(:decision_id => params[:id]).destroy_all
    sums = Hash.new
    element_list = Survey.find_by_sql("select distinct a_element_id from surveys where decision_id = " + params[:id] +
                                        " UNION " +
                                        "select distinct b_element_id from surveys where decision_id = " + params[:id])   
    
    for x_element in element_list
     sum_rows = Survey.find_by_sql("select 1, a_value as sum_value from surveys where a_element_id = " + x_element.a_element_id.to_s +
                                        " UNION " +
                                        "select 2, b_value as sum_value from surveys where b_element_id = " + x_element.a_element_id.to_s) 
     sum_value = 0
     for i in sum_rows
      if i.sum_value != nil
        Rails.logger.warn "sum_value=" + ((Rational(*(i.sum_value.split('/').map( &:to_i )))).to_f).to_s
        @calculations = Calculation.new(:decision_id => params[:id], :element_id => x_element.a_element_id, :value => ((Rational(*(i.sum_value.split('/').map( &:to_i )))).to_f).to_s)
        if !@calculations.save
          format.html { redirect_to home_url, notice: 'An error occured calulating the results - we are sorry.' }          
        end
      end
     end
     @calculations = Calculation.new(:decision_id => params[:id], :element_id => x_element.a_element_id, :value => "1")
     if !@calculations.save
      format.html { redirect_to home_url, notice: 'An error occured calulating the results - we are sorry.' }          
     end
    end
  end
=end
  
  def sum_elements2
    @calculation = Calculation.where(:decision_id => params[:id]).destroy_all
    sums = Hash.new
    element_list = Survey.find_by_sql("select distinct a_element_id from surveys where decision_id = " + params[:id] +
                                        " UNION " +
                                        "select distinct b_element_id from surveys where decision_id = " + params[:id] +
                                        " order by 1 desc")   
    loop_count = element_list.count
    for x_element in element_list
     sum_rows = Survey.find_by_sql("select id, b_element_id, a_value as value, a_value_row as row_id from surveys where b_element_id = " + x_element.a_element_id.to_s + 
                                    " union " + 
                                    " select id, a_element_id, b_value as value, b_value_row as row_id from surveys where a_element_id = " + x_element.a_element_id.to_s) 
     sum_value = 0
     for i in sum_rows
      if i.value != nil
        sum_value += (Rational(*(i.value.split('/').map( &:to_i )))).to_f
        Rails.logger.warn Time.now.to_s + " for " + x_element.a_element_id.to_s + ": sum_value=" + ((Rational(*(i.value.split('/').map( &:to_i )))).to_f).to_s
        @calculations = Calculation.new(:decision_id => params[:id], :element_id => x_element.a_element_id, :value => ((Rational(*(i.value.split('/').map( &:to_i )))).to_f).to_s, :row_id => i.row_id)
        if !@calculations.save
          format.html { redirect_to home_url, notice: 'An error occured calulating the results - we are sorry.' }          
        end
      end
     end
     @calculations = Calculation.new(:decision_id => params[:id], :element_id => x_element.a_element_id, :value => "1", :row_id => loop_count)
     if !@calculations.save
      format.html { redirect_to home_url, notice: 'An error occured calulating the results - we are sorry.' }          
     end
     Rails.logger.warn Time.now.to_s + " for " + x_element.a_element_id.to_s + ": sum_value=1"
     sums[x_element.a_element_id] = (sum_value + 1)
     loop_count -= 1
    end
    return sums
  end
  
end