class EntriesController < ApplicationController
  before_filter :login_required!, :except => [:index, :show]

  def index
    @entries = Entry.published.page(params[:page])
  end

  def drafts
    authorize! :manage, Entry
    @entries = Entry.drafts.all

    respond_to do |format|
      format.json { render json: @entries }
    end
  end

  def new
    authorize! :new, Entry
    
    @entry = Entry.create title: "New Blog Post #{Entry.count}"
    redirect_to @entry
  end

  def show
    @entry = EntryDecorator.decorate(Entry.find_by_slug!(params[:id]))
  end

  def admin
    render layout: false
  end
end

