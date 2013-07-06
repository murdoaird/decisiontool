class SurveysController < ApplicationController
  # GET /surveys
  # GET /surveys.json
  def index
    @surveys = Survey.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @surveys }
    end
  end

  # GET /surveys/1
  # GET /surveys/1.json
  def show
    @survey = Survey.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @survey }
    end
  end

  # GET /surveys/new
  # GET /surveys/new.json
  def new
    @survey = Survey.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @survey }
    end
  end

  # GET /surveys/1/edit
  def edit
    @survey = Survey.find(params[:id])
  end

  # POST /surveys
  # POST /surveys.json
  def create
    @survey = Survey.new(params[:survey])

    respond_to do |format|
      if @survey.save
        format.html { redirect_to root_url, notice: 'Survey was successfully created.' }
        format.json { render json: @survey, status: :created, location: @survey }
      else
        format.html { render action: "new" }
        format.json { render json: @survey.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /surveys/1
  # PUT /surveys/1.json
  def update
    @survey = Survey.find(params[:id])

    respond_to do |format|
      if @survey.update_attributes(params[:survey])
        format.html { redirect_to root_url, notice: 'Survey was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @survey.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /surveys/1
  # DELETE /surveys/1.json
  def destroy
    @survey = Survey.find(params[:id])
    @survey.destroy

    respond_to do |format|
      format.html { redirect_to surveys_url }
      format.json { head :no_content }
    end
  end
  
  def save_survey
    
    decision_id = params[:id]
    
    @survey_old = Survey.where(:decision_id => params[:id]).destroy_all
    
    #params.sort.map do |key,value|
    params.each do |key,value|
      Rails.logger.warn Time.now.to_s + " Param #{key}: #{value}"
      if key.start_with?('opt_')
        #we need to save a new survey
        selection = value.split(' ')
        #selection[0]
        #selection[1]
        #selection[2] 
        b_val = ""
        a_val = ""
        a_val_row = 0
        b_val_row = 0
        a_val_col = 0
        b_val_col = 0
        
        case Integer(selection[0])
          when 1
            a_val = "9"
            b_val = "1/9"
          when 2
            a_val = "7"
            b_val = "1/7"
          when 3
            a_val = "5"
            b_val = "1/5"
          when 4
            a_val = "3"
            b_val = "1/3"
          when 5
            a_val = "1"
            b_val = "1"
          when 6
            a_val = "1/3"
            b_val = "3"
          when 7
            a_val = "1/5"
            b_val = "5"
          when 8
            a_val = "1/7"
            b_val = "7"
          when 9
            a_val = "1/9"
            b_val = "9"
          else
            a_val = "99"
            b_val = "99"
         end                  
         Rails.logger.warn "BValue #{b_val}" 
         @survey = Survey.new(:decision_id => decision_id, :a_element_id => selection[1], :b_element_id => selection[2], :a_value => a_val, :b_value => b_val)
          if !@survey.save
            format.html { redirect_to surveys_url, notice: 'An error occured saving the survey - we are sorry.' }          
          end
      end
    end
    calc_grid_refs(params, decision_id)
    respond_to do |format|
      format.html { redirect_to root_url, notice: 'Your comparisons were successfully saved.' }
    end
  end

  #class level assignment of constants required
  START_COL = 2
  START_RI = 1
  START_CD = 1
      
  def calc_grid_refs (survey_data, decision_id)
    
    row_count=0
    col_count=START_COL
    col_decrement=START_CD
    row_increment=START_RI
    prev_element_id = 0
    grid_row_count = 0

    params.each do |key,value|
      if key.start_with?('opt_')
        #we need to save a new survey
        selection = value.split(' ')
        a_element_id = selection[1].to_i
        b_element_id = selection[2].to_i
        Rails.logger.warn Time.now.to_s + " calc_grid_refs #{key}: #{value}"
        if (prev_element_id == 0) or (prev_element_id != a_element_id)
          grid_row_count += 1 
          row_count += 1 
          if prev_element_id == 0
            col_count = START_COL 
          else
            col_count = (START_COL + (grid_row_count-1)) 
          end if
          row_increment = START_RI 
          col_decrement = START_CD
        else
          col_count += 1 
          row_increment += 1
          col_decrement += 1 
        end
        Rails.logger.warn Time.now.to_s + " calc_grid_refs a_row #{row_count}"
        Rails.logger.warn Time.now.to_s + " calc_grid_refs a_col #{col_count}"
        Rails.logger.warn Time.now.to_s + " calc_grid_refs b_row #{(row_count + row_increment)}"
        Rails.logger.warn Time.now.to_s + " calc_grid_refs b_col #{(col_count - col_decrement)}"
        
        @survey = Survey.where(decision_id: decision_id, a_element_id: a_element_id, b_element_id: b_element_id).first
        @survey.a_value_row = row_count
        @survey.a_value_col = col_count
        @survey.b_value_row = (row_count + row_increment)
        @survey.b_value_col = (col_count - col_decrement)
        if !@survey.save
          Rails.logger.warn Time.now.to_s + 'Survey grid references were unable to be saved.' 
        end
        prev_element_id = a_element_id
      end
    end
  end
end
