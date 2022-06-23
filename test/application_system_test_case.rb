require 'test_helper'

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  headless = ENV['SELENIUM_HEADLESS_CHROME'].present?
  browser = headless ? :headless_chrome : :chrome

  driven_by :selenium, using: browser, screen_size: [1400, 1400]
end
