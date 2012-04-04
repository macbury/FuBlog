class EntryDecorator < ApplicationDecorator
  decorates :entry

  def link
    options = {}
    options = { data: { type: "title" } } if editable?
    h.link_to model.title, h.entry_path(id: model.slug), options
  end

  def publish_at
    options = {}
    options = { data: { type: "publish-at" } } if editable?
    if model.published? 
      h.time_tag model.publish_at, options
    else
      h.content_tag :span, I18n.t("entries.unpublished"), options
    end
  end

end