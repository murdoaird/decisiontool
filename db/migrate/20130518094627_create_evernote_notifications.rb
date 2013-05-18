class CreateEvernoteNotifications < ActiveRecord::Migration
  def change
    create_table :evernote_notifications do |t|
      t.string :user_id
      t.string :note_guid
      t.string :action
      t.datetime :notification_date

      t.timestamps
    end
  end
end
