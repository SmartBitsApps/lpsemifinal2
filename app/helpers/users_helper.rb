module UsersHelper
  def full_name
		self.full_name = [first_name, last_name].join(' ')
	end
end
