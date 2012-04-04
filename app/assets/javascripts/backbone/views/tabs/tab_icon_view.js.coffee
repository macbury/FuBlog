
class Core.Views.Tabs.TabIconView extends Backbone.View
  tabView: null
  tagName: "li"

  events: 
    "click a" : "select"

  initialize: (options) ->
    @tabView = options.tabView

  startLoading: -> $(@el).addClass("loading")
  stopLoading: -> $(@el).removeClass("loading")

  select: =>
    @trigger("tab:select", { iconView: this })
    $(@el).addClass("active")
    false
  
  unselect: =>
    $(@el).removeClass("active")
    false

  render: =>
    item = @make("a", { href: "#" }, @make("span", {}, @tabView.getLabel()))
    $(@el).html(item).addClass(@tabView.labelClass())

    this



