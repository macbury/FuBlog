class Core.Views.Tabs.EntriesTabView extends Core.Views.BaseTabView
  getLabel: -> "Entries"
  labelClass: -> "entries"

  initialize: (options) ->
    super(options)
    Core.Store.EntriesGroup.on "sync:start sync:end sync:error", (options) => @render()
    @tabIcon.on "tab:select", => Core.Store.EntriesGroup.fetch()

  addOne: (entryGroup) =>
    view = new Core.Views.Entries.EntryGroupView( model: entryGroup )
    $(@el).append(view.render().el)

  addAll: =>
    $(@el).empty()
    _.each Core.Store.EntriesGroup.models, @addOne

  render: =>
    super
    if Core.Store.EntriesGroup.isDownloaded()
      @tabIcon.stopLoading()
      @addAll()
    else
      @tabIcon.startLoading()
      $(@el).html("Syncing...")
    this