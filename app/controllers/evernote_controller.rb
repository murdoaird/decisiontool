class EvernoteController < ApplicationController

  def webhook
    newNote = EvernoteNotification.new()

    newNote.note_guid=params[:guid].to_s
    newNote.user_id=params[:userId].to_s
    newNote.action=params[:reason].to_s
    newNote.notification_date=Time.now()
    newNote.save()

    render :text => "true", :status => 200

  end


end
