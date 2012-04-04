class Entry
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Versioning
  include Mongoid::Slug

  field :title, type: String
  field :publish_at, type: Time
  field :slug, type: String

  field :editing, type: Boolean, default: true

  index :slug, unique: true
  slug  :title
  max_versions 10

  validates :title, presence: true

  embeds_many :parts

  scope :drafts, where(publish_at: nil)
  scope :published, -> { where(:publish_at.lte => Time.zone.now) }

  def publish!
    self.publish_at = Time.zone.now
    self.save
  end

  def published?
    self.publish_at.present? && self.publish_at < Time.zone.now
  end

  def to_param
    self.id.to_s
  end

  # return a key value with day of month with count of entries for it
  def self.date_groups
    Entry.collection.group({ 
      keyf: "function(entry) {
        if (entry.publish_at) {
          date = new Date(entry.publish_at); 
          return { month: date.getMonth(), year: date.getFullYear(), drafts: false };
        } else {
          return { drafts: true };
        }
      };",
      initial: { count: 0 },
      reduce: "function(a,b){ b.count += 1 }" 
    })
  end
end
