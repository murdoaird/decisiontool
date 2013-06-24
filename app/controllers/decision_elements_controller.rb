class DecisionElementsController < ApplicationController
  # GET /decision_elements
  # GET /decision_elements.json
  def index
    @decision_elements = DecisionElement.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @decision_elements }
    end
  end

  # GET /decision_elements/1
  # GET /decision_elements/1.json
  def show
    @decision_element = DecisionElement.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @decision_element }
    end
  end

  # GET /decision_elements/new
  # GET /decision_elements/new.json
  def new
    @decision_element = DecisionElement.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @decision_element }
    end
  end

  # GET /decision_elements/1/edit
  def edit
    @decision_element = DecisionElement.find(params[:id])
  end

  # POST /decision_elements
  # POST /decision_elements.json
  def create
    @decision_element = DecisionElement.new(params[:decision_element])

    respond_to do |format|
      if @decision_element.save
        format.html { redirect_to @decision_element, notice: 'Decision element was successfully created.' }
        format.json { render json: @decision_element, status: :created, location: @decision_element }
      else
        format.html { render action: "new" }
        format.json { render json: @decision_element.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /decision_elements/1
  # PUT /decision_elements/1.json
  def update
    @decision_element = DecisionElement.find(params[:id])

    respond_to do |format|
      if @decision_element.update_attributes(params[:decision_element])
        format.html { redirect_to @decision_element, notice: 'Decision element was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @decision_element.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /decision_elements/1
  # DELETE /decision_elements/1.json
  def destroy
    @decision_element = DecisionElement.find(params[:id])
    @decision_element.destroy

    respond_to do |format|
      format.html { redirect_to decision_elements_url }
      format.json { head :no_content }
    end
  end
end
