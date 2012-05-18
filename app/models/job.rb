class Job < ActiveRecord::Base
  validates :name, :url, :location, :whitelabel_id, presence: true

  attr_accessible :name, :url, :location, :whitelabel

  belongs_to :location
  belongs_to :whitelabel
end
