class ClientVideo < ActiveRecord::Base
  attr_accessible :user_id, :video_type, :name, :url
belongs_to :user

extend FriendlyId
    friendly_id :name, use: :slugged

end
