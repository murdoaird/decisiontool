class UsersController < ApplicationController
  before_filter :authenticate_user!

  SANDBOX = true


  def index
    authorize! :index, @user, :message => 'Not authorized as an administrator.'
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    authorize! :update, @user, :message => 'Not authorized as an administrator.'
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user], :as => :admin)
      redirect_to users_path, :notice => "User updated."
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end

  def destroy
    authorize! :destroy, @user, :message => 'Not authorized as an administrator.'
    user = User.find(params[:id])
    unless user == current_user
      user.destroy
      redirect_to users_path, :notice => "User deleted."
    else
      redirect_to users_path, :notice => "Can't delete yourself."
    end
  end

  def evernote
    @last_error = ''
    callback_url = request.url.chomp("requesttoken").concat("callback")
    begin
      session[:request_token] = client.request_token(:oauth_callback => callback_url)
      redirect_to session[:request_token].authorize_url

    rescue => e
      @last_error = "Error obtaining temporary credentials: #{e.message}"
    end

  end

  def evernotecallback
    session[:oauth_verifier] = params['oauth_verifier']
    session[:access_token] = session[:request_token].get_access_token(:oauth_verifier => session[:oauth_verifier])

    # Get username
    session[:username] = en_user.username

    redirect_to users_path, :notice => en_user.username
  end

  def auth_token
    session[:access_token].token if session[:access_token]
  end

  def client
    @client ||= EvernoteOAuth::Client.new(token: auth_token, consumer_key:ENV['OAUTH_CONSUMER_KEY'].dup, consumer_secret:ENV['OAUTH_CONSUMER_SECRET'].dup, sandbox: SANDBOX)
  end

  def user_store
    @user_store ||= client.user_store
  end

  def note_store
    @note_store ||= client.note_store
  end

  def en_user
    user_store.getUser(auth_token)
  end

  def notebooks
    @notebooks ||= note_store.listNotebooks(auth_token)
  end

  def total_note_count
    filter = Evernote::EDAM::NoteStore::NoteFilter.new
    counts = note_store.findNoteCounts(auth_token, filter, false)
    notebooks.inject(0) do |total_count, notebook|
      total_count + (counts.notebookCounts[notebook.guid] || 0)
    end
  end

end