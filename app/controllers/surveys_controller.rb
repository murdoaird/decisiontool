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
        format.html { redirect_to @survey, notice: 'Survey was successfully created.' }
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
        format.html { redirect_to @survey, notice: 'Survey was successfully updated.' }
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
    
    params.each do |key,value|
      Rails.logger.warn "Param #{key}: #{value}"
      if key.start_with?('opt_')
        #we need to save a new survey
        #"option_3elementA_1elementB_2
        selection = value.split(' ')
        selection[0]
        selection[1]
        selection[2] 
        #b_val = BigDecimal.new("0")
        #a_val = BigDecimal.new("0")
        b_val = ""
        a_val = ""
        
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

    respond_to do |format|
      format.html { redirect_to surveys_url, notice: 'Survey was successfully saved.' }
    end
  end
end
