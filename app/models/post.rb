class Post < ActiveRecord::Base
  attr_accessible :body, :title, :user_id, :blog_images_attributes, :category_ids, :published_at, :published
  
  has_many  :blog_images
  accepts_nested_attributes_for :blog_images, :allow_destroy => true
  
  has_many :videos
  
  belongs_to :user
  has_many :comments
  
  has_many :categorizations
  has_many :categories, :through => :categorizations
  
  default_scope order('published_at DESC')
  # named_scope :published, :conditions => "published_at <= now()"
  
#  scope :by_category_id, lambda {|cid| joins(:categories).where(['categories.id =?', cid])}
  
  extend FriendlyId
    friendly_id :title, use: :slugged
  end
