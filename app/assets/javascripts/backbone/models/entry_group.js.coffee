class Core.Models.EntryGroup extends Backbone.Model
  entries: null
  default:
    drafts: true
    month: null
    year: null
    count: 0
    opened: false

  getLabel: ->
    if @get("drafts")
      I18n.t("entries.drafts")
      
    else
      locale = I18n.currentLocale()
      month = I18n.translations[locale].date.month_names[parseInt(@get("month"))]
      year = parseInt(@get("year"))
      [month, year].join(" ")

  initialize: ->
    @entries = new Core.Collections.Entries()
    @entries.url = => 
      if @get("drafts")?
        "/admin/entries?drafts=1"
      else
        "/admin/entries?year="+@get("year") + "&month=" + @get("month")
    @entries.fetch() if @get("drafts")


class Core.Collections.EntriesGroup extends Core.Library.Collection
  url: "/admin/entries/groups"
  model: Core.Models.EntryGroup