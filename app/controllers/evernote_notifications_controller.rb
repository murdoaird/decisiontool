class EvernoteNotificationsController < ApplicationController
  # GET /evernote_notifications
  # GET /evernote_notifications.json
  def index
    @evernote_notifications = EvernoteNotification.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @evernote_notifications }
    end
  end

  # GET /evernote_notifications/1
  # GET /evernote_notifications/1.json
  def show
    @evernote_notification = EvernoteNotification.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @evernote_notification }
    end
  end

  # GET /evernote_notifications/new
  # GET /evernote_notifications/new.json
  def new
    @evernote_notification = EvernoteNotification.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @evernote_notification }
    end
  end

  # GET /evernote_notifications/1/edit
  def edit
    @evernote_notification = EvernoteNotification.find(params[:id])
  end

  # POST /evernote_notifications
  # POST /evernote_notifications.json
  def create
    @evernote_notification = EvernoteNotification.new(params[:evernote_notification])

    respond_to do |format|
      if @evernote_notification.save
        format.html { redirect_to @evernote_notification, notice: 'Evernote notification was successfully created.' }
        format.json { render json: @evernote_notification, status: :created, location: @evernote_notification }
      else
        format.html { render action: "new" }
        format.json { render json: @evernote_notification.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /evernote_notifications/1
  # PUT /evernote_notifications/1.json
  def update
    @evernote_notification = EvernoteNotification.find(params[:id])

    respond_to do |format|
      if @evernote_notification.update_attributes(params[:evernote_notification])
        format.html { redirect_to @evernote_notification, notice: 'Evernote notification was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @evernote_notification.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /evernote_notifications/1
  # DELETE /evernote_notifications/1.json
  def destroy
    @evernote_notification = EvernoteNotification.find(params[:id])
    @evernote_notification.destroy

    respond_to do |format|
      format.html { redirect_to evernote_notifications_url }
      format.json { head :no_content }
    end
  end
end
