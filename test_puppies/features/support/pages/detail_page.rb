class DetailPage
	include PageObject
	page_url "http://puppies.herokuapp.com"
	
	button(:add_to_cart, :value => "Adopt Me!")
end
