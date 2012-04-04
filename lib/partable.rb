module Partable
  
  def self.widget_name
    I18n.t("widgets.#{self.name.underscore}.name")
  end

  def self.widget_description
    I18n.t("widgets.#{self.name.underscore}.descripton")
  end

  def self.accept_files(accept)
    self.recive_files = accept
  end

  def self.accept_mime_type(types)
    types = types.class == Array ? types : [types]
    self.mime_type = types
  end

  def self.accept_url_regexp(regexps)
    regexps = regexps.class == Array ? regexps : [regexps]
    self.url_regexp = regexps
  end
end