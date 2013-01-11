require 'pstore'
class ActiveStore < PStore
	def initialize dbname
		super(dbname)
	end
	def create key, value
		transaction do
		   self[key]=  value
		end   
	end
	def read key
		transaction do
			self[key]
		end
	end
	def update key, value
		transaction do
			abort if self[key].nil?
		end
		transaction do
			self[key]= value
		end
	end
	def delete key
		transaction do
			self.delete key
		end
	end
	def keys
		transaction do
			roots
		end
	end
	def list
		all = []
		transaction do
			roots.each do |key|
				all << self[key]
			end	
		end
		all
	end
end
