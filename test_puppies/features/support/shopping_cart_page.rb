class ShoppingCartPage
	include PageObject
	NAME_COLUMN = 1
	SUBTOTAL_COLUMN = 3
	LINES_PER_PUPPY = 6

	button(:proceed_to_checkout, :value => "Complete the Adoption")
	button(:continue_shopping, :value => "Adopt Another Puppy")
	table(:cart, :index => 0)
	cell(:cart_total, :class => "total_cell")

	def name_for_line_item(line_item)
		table_value(line_item, NAME_COLUMN)
	end

	def subtotal_for_line_item(line_item)
		table_value(line_item, SUBTOTAL_COLUMN)
	end

	private
		def table_value(lineitem, column)
			row = (lineitem.to_i - 1)*LINES_PER_PUPPY
			cart_element[row][column].text
		end
end

class CheckoutPage
	include PageObject

	text_field(:name, :id => "order_name")
	text_field(:address, :id => "order_address")
	text_field(:email, :id => "order_email")
	select_list(:pay_type, :id => "order_pay_type")
	button(:place_order, :value => "Place Order")

end

class DetailPage
	include PageObject
	button(:add_to_cart, :value => "Adopt Me!")
end

class HomePage
	include PageObject
	# button(:first_puppy, :value => "View Details", :index => 0)
	# button(:second_puppy, :value => "View Details", :index => 1)

	def select_puppy_number(index)
		button_element(:value => "View Details", :index => index - 1).click()
	end
end
