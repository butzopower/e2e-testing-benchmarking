require "capybara"
require "capybara/rspec"
require "capybara/dsl"

Capybara.javascript_driver = :selenium

if ENV["PHANTOMJS"] == "true"
  require "capybara/poltergeist"
  Capybara.javascript_driver = :poltergeist
end

include Capybara::DSL