require 'watir-webdriver'
require 'rubygems'
require 'appium_lib'

desired_caps = {
   caps: {
   	platformName: 'iOS',
	platformVersion: '9.3',
	deviceName: 'iPhone 6s Plus',
	browserName: 'Safari'
   }
}



Before do
  # @appium_driver = Appium::Driver.new(desired_caps)
  # driver = @appium_driver.start_driver
  # Appium.promote_appium_methods Object
  @browser = Watir::Browser.new :firefox
end


After do
  @browser.close
end