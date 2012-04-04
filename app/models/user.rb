class User
  include Mongoid::Document
  include Mongoid::Timestamps

  field :provider, :type => String
  field :uid, :type => String
  field :name, :type => String

  field :session_token, type: String, default: -> { SecureRandom.hex(32) }

  def self.from_omniauth(auth)
    User.where(provider: auth["provider"], uid: auth["uid"]).first || create_with_omniauth(auth)
  end

  def self.create_with_omniauth(auth)
    klass = User.count == 0 ? Admin : User # first user becomes admin!
    klass.create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
    end
  end

  def session_token!
    while true
      self.session_token = SecureRandom.hex(32)
      break unless User.where(session_token: self.session_token).first.present?
    end
    self.save
    self.session_token
  end

  def admin?
    self.class == Admin
  end
end
