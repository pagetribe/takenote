class Post < ActiveRecord::Base
	validates :name, :presence => true
	validates :body, :presence => true,
										:length => { :minimum => 5 }
end
