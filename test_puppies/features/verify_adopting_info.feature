Feature: Verify adopting info

Scenario: Validate cart with one puppy
	Given I launched puppy adoption site
	When I click the First View Details button
	And I click the Adopt Me button
	Then I should see "Brook" as the name for line item 1
	And I should see "$34.95" as the subtotal for line item 1
	And I should see "$34.95" as the cart total