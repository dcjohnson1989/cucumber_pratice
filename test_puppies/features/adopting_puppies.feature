Feature: Adopting puppies
	As a puppy lover
	I want to adopt puppies
	So they can chew my furniture

Background:
	Given I launched puppy adoption site

Scenario Outline: Adopting a puppy
	When I click the View Details button
	And I click the Adopt Me button
	And I click the Complete the Adoption button
	And I enter "<name>" in the name field
	And I enter "<address>" in the address field
	And I enter "<email>" in the email field
	And I select "<pay_type>" from the pay with dropdown
	And I click the Place Order button
	Then I should see "Thank you for adopting a puppy"

Examples:
	| name	| address		  | email				| pay_type		|
	| Cheezy| 123 Main Street | cheezy@example.com 	| Credit card	|
	| Joe	| adfasdf Street  | Joe@example.com 	| Check 		|


#Scenario: Adopting two puppys
#	When I click the First View Details button
#	And I click the Adopt Me button
#	And I click adopt another puppy button
#	And I click the Second View Details button
#	And I click the Adopt Me button
#	And I click the Complete the Adoption button
#	And I enter "Cheezy" in the name field
#	And I enter "123 Main Street" in the address field
#	And I enter "cheezy@example.com" in the email field
#	And I select "Credit card" from the pay with dropdown
#	And I click the Place Order button
#	Then I should see "Thank you for adopting a puppy"