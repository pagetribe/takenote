class Post < ActiveRecord::Base
	validates :name, :presence => true
	validates :body, :presence => true,
										:length => { :minimum => 5 }
										
	has_many :taggings, :dependent => :destroy
	has_many :tags, :through => :taggings
	
  attr_writer :tag_names # used when edit is called to fill the tags in form already assigned
	after_save :assign_tags # callback
	
	scope :tagged_with, lambda { |tag| joins(:tags).where(:tags => {:name => tag})}

  def self.search(search) 
       includes(:tags).where(["posts.name LIKE (?) OR tags.name LIKE (?) OR posts.body LIKE (?)","%#{search}%", "%#{search}%", "%#{search}%"])
  end

	
	# accessor method
	def tag_names 
	  @tag_names || tags.map(&:name).join(' ') # return instance var if assigned or return all tag names
	end
  
  private
  
  # callback after_save
  def assign_tags
    if @tag_names # if exists get tag_names and split by spaces
      self.tags = @tag_names.split(/\s+/).map do |name|
        Tag.find_or_create_by_name(name) # return or create tag
      end
    end
  end
end
