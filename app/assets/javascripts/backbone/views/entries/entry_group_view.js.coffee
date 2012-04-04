class Core.Views.Entries.EntryGroupView extends Backbone.View
  className: "group"
  template: JST["backbone/templates/entries/entry_group_view"]

  events:
    "click .toggle" : "toggle"

  initialize: =>
    @model.on("change:opened", @entriesVisibility)

  entriesVisibility: =>
    if @model.get("opened")
      @$(".toggle").addClass("collapse")
      @$(".list").show()
      @model.entries.download()
    else
      @$(".toggle").removeClass("collapse")
      @$(".list").hide()

  toggle: =>
    opened = @model.get("opened")
    opened = !opened
    @model.set({"opened": opened})

    false

  render: =>
    $(@el).html(@template( entryGroup: @model ))
    @entriesVisibility()
    this