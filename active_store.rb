class ActiveStore < PStore
	def initialize dbname
		super(dbname)
	end
	def create key, value
		transaction do db
		   db[key] =  value
		end   
	end
	def read key
		transaction do db
			db[key]
		end
	end
	def update key, value
		exist = transaction do db
			db[key]
		end
		abort if exist.nil?
		transaction do db
			db[key] = value
		end
	end
	def delete
		transaction do db
			db.delete key
		end
	end
end
