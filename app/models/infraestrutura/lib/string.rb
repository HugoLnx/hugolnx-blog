class String
	def to_date
		match = self.match(/.*\/.*\/(.*)$/)
		return false if match.nil?
		year_size = match[1].size
		date_format = year_size == 2 ? '%d/%m/%y' : '%d/%m/%Y'
		Date.strptime self, date_format
	end
end
