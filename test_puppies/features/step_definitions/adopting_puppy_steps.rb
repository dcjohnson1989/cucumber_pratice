timer = 10

Given /^I launched puppy adoption site$/ do
	@browser.goto "http://puppies.herokuapp.com"
	# @home = HomePage.new(@browser)
end

When /^I click the View Details button$/ do
	sleep timer
	# @home.select_puppy_number(1)
	on(HomePage).select_puppy_number(1)

end

When /^I click the First View Details button$/ do
	sleep timer
	on(HomePage).select_puppy_number(1)

end

And /^I click the Adopt Me button$/ do
	sleep timer
	on(DetailPage).add_to_cart

end

And /^I click adopt another puppy button$/ do
	sleep timer
	on(ShoppingCartPage).continue_shopping
end

When /^I click the Second View Details button$/ do
	sleep timer
	on(HomePage).select_puppy_number(2)

end

And /^I click the Complete the Adoption button$/ do
	sleep timer
	on(ShoppingCartPage).proceed_to_checkout
end

And /^I enter "([^\"]*)" in the name field$/ do |name|
	sleep timer
	on(CheckoutPage).name = name
end

And /^I enter "([^\"]*)" in the address field$/ do |address|
	on(CheckoutPage).address = address
end

And /^I enter "([^\"]*)" in the email field$/ do |email|
	on(CheckoutPage).email = email
end

And /^I select "([^\"]*)" from the pay with dropdown$/ do |payment|
	on(CheckoutPage).pay_type = payment
end

And /^I click the Place Order button$/ do
	sleep timer
	on(CheckoutPage).place_order
end

Then /^I should see "([^\"]*)"$/ do |expected|
	sleep timer
	expect(@browser.text).to include expected
end

Then /^I should see "([^\"]*)" as the name for line item (\d+)$/ do |name, line_item| 
	sleep timer
	expect(on(ShoppingCartPage).name_for_line_item(line_item.to_i)).to include name
end

And /^I should see "([^\"]*)" as the subtotal for line item (\d+)$/ do |price, line_item|
	expect(on(ShoppingCartPage).subtotal_for_line_item(line_item.to_i)).to eql price
end

And /^I should see "([^\"]*)" as the cart total$/ do |total|
	expect(on(ShoppingCartPage).cart_total).to eql total
end
