class Core.Views.MainView extends Backbone.View
  el: "body"

  registerTab: (name, klass) =>
    this[name] = new klass( mainView: this )
    @tabsList.push(this[name])

  initialize: ->
    images_urls = $.preloadCssImages()
    
    loadCallback = _.after(images_urls.length, @onLoad);
    _.each images_urls, (image_url) ->
      img = new Image()
      img.onload = loadCallback;
      img.src = image_url

  onLoad: =>
    Core.Store.EntriesGroup = new Core.Collections.EntriesGroup()

    @tabsList = []
    @registerTab "entriesView", Core.Views.Tabs.EntriesTabView
    @registerTab "commentsView", Core.Views.Tabs.CommentsTabView
    @on "tab:select", @select
    @render()

  select: (options) =>
    tab.unselect() for tab in @tabsList
    @$('.editor').html(options.tabView.render().el)

  render: ->
    @$('.application').show()
    @$('#boxes').empty()
    @$('#boxes').append(tab.tabIcon.render().el) for tab in @tabsList
      