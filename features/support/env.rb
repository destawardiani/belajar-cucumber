require 'capybara/cucumber'
require 'capybara-screenshot/cucumber'
# require 'capybara/rspec'
require 'selenium-webdriver'

Capybara.register_driver :chrome do |app|
	args = [
		"--window-size=1366,768"
	]
	client = Selenium::WebDriver::Remote::Http::Default.new
	client.timeout = 480
	Capybara::Selenium::Driver.new(app, browser: :chrome, args: args, http_client: client)
end
Capybara.javascript_driver = :chrome

Capybara::Screenshot.register_driver(:chrome) do |driver, path|
	driver.browser.save_screenshot(path)
end

Capybara.app_host = 'http://www.google.com'
Capybara.default_driver = :chrome
Capybara.default_max_wait_time = 3
Capybara::Screenshot.autosave_on_failure = true
Capybara::Screenshot.webkit_options = { width: 1366, height: 768 }
Capybara::Screenshot.prune_strategy = { keep: 50 }
Capybara::Screenshot.append_timestamp = true
Capybara.save_path = "screenshots"