class User < ActiveRecord::Base
  has_secure_password
  has_many :trips
  has_many :destinations, through: :trips

  def slug
    self.username.downcase.gsub(' ','-')
  end

  def self.find_by_slug(slug)
    self.all.find{|u| u.slug == slug}
  end
end
