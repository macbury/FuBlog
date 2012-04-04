#= require_self
#= require_tree ./libs
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./views
#= require_tree ./routers

window.Core =
  Models: {}
  Library: {}
  Collections: {}
  Routers: {}
  Views: {
    Entries: {}
  }
  Store: {}


$(document).ready -> window.mainView = new Core.Views.MainView()