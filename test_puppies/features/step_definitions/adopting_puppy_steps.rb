timer = 10

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
end

And /^I click adopt another puppy button$/ do
	sleep timer
	@browser.button(:value => "Adopt Another Puppy").click
end

When /^I click the Second View Details button$/ do
	sleep timer
	@browser.button(:value => "View Details", :index => 2).click
end

And /^I click the Complete the Adoption button$/ do
	sleep timer
	@browser.button(:value => "Complete the Adoption").click
end

And /^I enter "([^\"]*)" in the name field$/ do |name|
	sleep timer
	@browser.text_field(:id => "order_name").set(name)
end

And /^I enter "([^\"]*)" in the address field$/ do |address|
	@browser.text_field(:id => "order_address").set(address)
end

And /^I enter "([^\"]*)" in the email field$/ do |email|
	@browser.text_field(:id => "order_email").set(email)
end

And /^I select "([^\"]*)" from the pay with dropdown$/ do |payment|
	@browser.select_list(:id => "order_pay_type").select(payment)
end

And /^I click the Place Order button$/ do
	sleep timer
	@browser.button(:value => "Place Order").click
end

Then /^I should see "([^\"]*)"$/ do |expected|
	sleep timer
	expect(@browser.text).to include expected
end

def row_for(line_item)
	return (line_item.to_i - 1) * 6
end

def cart_line_item(line_item)
	@browser.table(:index => 0)[row_for(line_item)]
end

Then /^I should see "([^\"]*)" as the name for line item (\d+)$/ do |name, line_item| 
	sleep timer
	expect(cart_line_item(line_item)[1].text).to include name
end

And /^I should see "([^\"]*)" as the subtotal for line item (\d+)$/ do |price, line_item|
	expect(cart_line_item(line_item)[3].text).to eql price
end

And /^I should see "([^\"]*)" as the cart total$/ do |total|
	expect(@browser.td(:class => 'total_cell').text).to eql total
end