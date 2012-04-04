Core.Views.Tabs = {}

class Core.Views.BaseTabView extends Backbone.View
  labelClass: -> throw("Implement label class")
  getLabel: -> throw("Implement label name")

  initialize: (options) ->
    @mainView = options.mainView
    throw "Specify main view for BaseTabView" unless @mainView
    @tabIcon = new Core.Views.Tabs.TabIconView( tabView: this )
    @tabIcon.on "tab:select", @select

  select: (options) => @mainView.trigger "tab:select", { tabView: this }
  
  content: =>
    @render() unless @rendered?
    @el

  unselect: =>
    @tabIcon.unselect()

  render: =>
    @rendered = true
    $(@el).html("Nothing...")
    this