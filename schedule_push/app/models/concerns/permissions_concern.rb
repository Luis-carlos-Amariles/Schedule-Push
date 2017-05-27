module PermissionsConcern
	extend ActiveSupport::Concern

	# use for capitalize name
	def save_valid_name
		self.name = self.name.split.map(&:capitalize).join(' ')
	end

	# use for capitalize name and surname
	def save_valid_name_with_surname
		self.name = self.name.split.map(&:capitalize).join(' ')
		self.surname = self.surname.split.map(&:capitalize).join(' ')
	end

	# use for capitalize text
	def capitalize_string(text)
		text = text.split.map(&:capitalize).join(' ')
	end

	# use for return level and number of semester
	def complement_semester
		"• #{self.number} - #{self.level.capitalize}"
	end

	# return name with surname of user
	def name_with_surname
		"#{self.name} #{self.surname}"
	end

	# use for return number block and initial hour of class
	def block_with_hour
		"#{self.block} - #{self.start_hour.to_s.insert(1, ':')}"
	end 

	# use for return weeks days
	def week_days
		[['Monday','Monday'],['Tuesday','Tuesday'],['Wednesday','Wednesday'],['Thursday','Thursday'],['Friday','Friday'],['Saturday','Saturday']]
	end

	# use for get hour of scheduled
	def scheduled_hours
		[['6:30',630],['7:15',715],['8:30', 830],['9:15', 915]]
	end

	# use for concatenate params of rooms
	def code_with_name
		"#{self.code} - #{self.name}"
	end

	# use for concatenate params of teacher by matter for scheduleds
	def teacher_with_matter
		"#{self.user.name_with_surname} - #{self.matter.name} - semester: #{self.matter.semester.number}"
	end
end