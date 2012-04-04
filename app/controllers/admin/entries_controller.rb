require "admin_controller"
class Admin::EntriesController < AdminController
  respond_to :json

  def index
    authorize! :manage, Entry

    @entries = Entry.all
    respond_with @entries
  end

  def groups
    sleep 2
    authorize! :manage, Entry
    @entries_group = Entry.date_groups

    respond_with @entries_group
  end
end
