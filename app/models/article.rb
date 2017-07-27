class Article < ActiveRecord::Base
	belongs_to :user
	has_many :images, :inverse_of => :article, :dependent => :destroy
	accepts_nested_attributes_for :images, allow_destroy: true
	# accepts_nested_attributes_for :images
	before_create :set_visits

	
	geocoded_by :location   # can also be an IP address

	after_validation :geocode, :if => :location_changed?
	after_destroy :rm_img_dir 
	after_create :send_mail
	def update_visits
		
		unless self.visits.nil?
			self.update(visits: self.visits + 1)
		end	
	end
	def rm_img_dir
    	 FileUtils.rm_rf("#{Rails.root}/public/uploads/dir/#{self.id}/")  if self.image
    end
	private

	def set_visits
		self.visits ||=0
	end

end
