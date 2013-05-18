class EvernoteNotification < ActiveRecord::Base
  attr_accessible :action, :note_guid, :notification_date, :user_id
end
