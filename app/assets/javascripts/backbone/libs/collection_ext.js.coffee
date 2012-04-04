SyncStatus =
  None: 0
  Running: 1
  Ended: 2
  Error: 2

class Core.Library.Collection extends Backbone.Collection
  constructor: (options) -> 
    super(options)
    @sync_status = SyncStatus.None

  isDownloading: => @sync_status == SyncStatus.Running
  isDownloaded:  => @sync_status == SyncStatus.Ended
  itFailed:      => @sync_status == SyncStatus.Error

  fetch: (options) =>
    if (options && options.force?) || !@isDownloading() || !@isDownloaded()
      @sync_status == SyncStatus.Running
      @trigger("sync:start", this)
      super
        success: (rsp, model) => 
          @sync_status = SyncStatus.Ended
          @trigger("sync:end", this)
        error: (rsp, model) =>
          @sync_status = SyncStatus.Error 
          @trigger("sync:error", this)


