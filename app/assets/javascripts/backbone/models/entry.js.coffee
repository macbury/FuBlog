class Core.Models.Entry extends Backbone.Model
  
class Core.Collections.Entries extends Core.Library.Collection
  url: "/admin/entries"
  model: Core.Models.Entry

  download: ->
    @fetch() unless @fetched?
    @fetched = true