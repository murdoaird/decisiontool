class ElementsController < ApplicationController
  # GET /elements
  # GET /elements.json
  def index
    @elements = Element.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @elements }
    end
  end

  # GET /elements/1
  # GET /elements/1.json
  def show
    @element = Element.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @element }
    end
  end

  # GET /elements/new
  # GET /elements/new.json
  def new
    @element = Element.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @element }
    end
  end

  # GET /elements/1/edit
  def edit
    @element = Element.find(params[:id])
  end

  # POST /elements
  # POST /elements.json
  def create
    @element = Element.new(params[:element])
    respond_to do |format|
      if @element.save
        #format.html { redirect_to @element, notice: 'Element was successfully created.' }
        #format.json { render json: @element, status: :created, location: @element }
        format.html { redirect_to root_url, notice: 'Element was successfully created.' }
        format.json { render json: @element, status: :created, location: @element }
      else
        format.html { render action: "new" }
        format.json { render json: @element.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /elements/1
  # PUT /elements/1.json
  def update
    @element = Element.find(params[:id])

    respond_to do |format|
      if @element.update_attributes(params[:element])
        format.html { redirect_to @element, notice: 'Element was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @element.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /elements/1
  # DELETE /elements/1.json
  def destroy
    @element = Element.find(params[:id])
    @element.destroy

    respond_to do |format|
      #TODO: redirect to modal pop up
      #how: http://stackoverflow.com/questions/13657009/issue-with-redirect-to-in-controller-action-load-modal-html-bootstrap
      format.html { redirect_to root_url, notice: 'Element was successfully deleted.'  }
      format.json { head :no_content }
    end
  end
end
