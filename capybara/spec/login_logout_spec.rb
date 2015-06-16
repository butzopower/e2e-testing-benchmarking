require "capybara"
require "capybara/rspec"
require "capybara/dsl"

# Capybara.current_driver = :selenium
require "capybara/poltergeist"
Capybara.current_driver = :poltergeist

Capybara.app_host = "http://localhost:8080"
Capybara.server_host = "localhost"
Capybara.server_port = "8080"

describe "logging and logging out" do
  include Capybara::DSL

  it "works" do
    visit "/uaa"

    fill_in "Email", with: "marissa"
    fill_in "Password", with: "koala"

    click_on "Sign in"

    expect(page).to have_content "Where to?"

    find(".dropdown-trigger", text: "marissa").click

    click_on "Sign Out"

    expect(page).to have_content "Welcome!"
  end
end

