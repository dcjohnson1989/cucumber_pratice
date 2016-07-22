class ShoppingCartPage
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
	# def initialize(browser)
	# 	@browser = browser
	# end
	# def name=(name)
	# 	@browser.text_field(:id => "order_name").set(name)
	# end
	# def address=(address)
	# 	@browser.text_field(:id => "order_address").set(address)
	# end
  #
	# def email=(email)
	# 	@browser.text_field(:id => "order_email").set(email)
	# end
  #
	# def pay_type=(pay_type)
	# 	@browser.select_list(:id => "order_pay_type").select(pay_type)
	# end
  #
	# def place_order
	# 	@browser.button(:value => "Place Order").click
	# end
end



