class Part
  include Mongoid::Document
  include Mongoid::Versioning
  include Partable

  class_attribute :recive_files, :mime_type, :url_regexp

  max_versions 10
  
  field :position, type: Integer

  embedded_in :entry

  self.recive_files = false
  self.mime_type = ["text/plain"]
  self.url_regexp = /.+/i

  def self.list
    Part.subclasses.map(&:name)
  end
end
