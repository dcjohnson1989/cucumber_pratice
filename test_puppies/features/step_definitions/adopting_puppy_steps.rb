timer = 2

Given /^I launched puppy adoption site$/ do
	@browser.goto "http://puppies.herokuapp.com"
end

When /^I click the View Details button$/ do
	sleep timer
	@browser.button(:value => "View Details").click
end

When /^I click the First View Details button$/ do
	sleep timer
	@browser.button(:value => "View Details").click
end

And /^I click the Adopt Me button$/ do
	sleep timer
	@browser.button(:value => "Adopt Me!").click
	@cart = ShoppingCartPage.new(@browser)
end

And /^I click adopt another puppy button$/ do
	sleep timer
	@cart.continue_shopping
end

When /^I click the Second View Details button$/ do
	sleep timer
	@browser.button(:value => "View Details", :index => 2).click
end

And /^I click the Complete the Adoption button$/ do
	sleep timer
	@cart.proceed_to_checkout
  @checkout = CheckoutPage.new(@browser)
end

And /^I enter "([^\"]*)" in the name field$/ do |name|
	sleep timer
	@checkout.name = name
end

And /^I enter "([^\"]*)" in the address field$/ do |address|
	@checkout.address = address
end

And /^I enter "([^\"]*)" in the email field$/ do |email|
	@checkout.email = email
end

And /^I select "([^\"]*)" from the pay with dropdown$/ do |payment|
	@checkout.pay_type = payment
end

And /^I click the Place Order button$/ do
	sleep timer
	@checkout.place_order
end

Then /^I should see "([^\"]*)"$/ do |expected|
	sleep timer
	expect(@browser.text).to include expected
end

Then /^I should see "([^\"]*)" as the name for line item (\d+)$/ do |name, line_item| 
	sleep timer
	expect(@cart.name_for_line_item(line_item.to_i)).to include name
end

And /^I should see "([^\"]*)" as the subtotal for line item (\d+)$/ do |price, line_item|
	expect(@cart.subtotal_for_line_item(line_item.to_i)).to eql price
end

And /^I should see "([^\"]*)" as the cart total$/ do |total|
	expect(@cart.cart_total).to eql total
end
