class Post < ActiveRecord::Base
  attr_accessible :body, :title, :user_id, :blog_images_attributes, :subcategorization_ids, :published_at, :published
  
  has_many  :blog_images, :dependent => :destroy
  accepts_nested_attributes_for :blog_images, :allow_destroy => true
  
  
  has_many :videos
  
  belongs_to :user
  has_many :comments
  
  has_many :categorizations,  :dependent => :destroy
  has_many :subcategorizations, :through => :categorizations
  has_many :categories, :through => :categorizations
  has_many :subcategories, :through => :categorizations
 
  
  default_scope order('published_at DESC')
  # named_scope :published, :conditions => "published_at <= now()"
  
#  scope :by_category_id, lambda {|cid| joins(:categories).where(['categories.id =?', cid])}



def self.search(search)
    where('title LIKE ?', "%#{search}%").where(:published => true).where("published_at <= ?", Time.now)
end

def self.fromsecond(recent)
  where(:published => true).where("published_at <= ?", Time.now).where('id != ?', recent.id)
  
end

def self.published
  where(:published => true).where("published_at <= ?", Time.now)
  
end


  extend FriendlyId
    friendly_id :title, use: :slugged
  end
