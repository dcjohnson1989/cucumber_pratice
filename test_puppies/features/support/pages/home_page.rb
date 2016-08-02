class HomePage
	include PageObject
	page_url "http://puppies.herokuapp.com"
	# button(:first_puppy, :value => "View Details", :index => 0)
	# button(:second_puppy, :value => "View Details", :index => 1)

	def select_puppy_number(index)
		button_element(:value => "View Details", :index => index - 1).click()
	end
end