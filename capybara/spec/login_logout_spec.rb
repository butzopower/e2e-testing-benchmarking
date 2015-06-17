require "spec_helper"

describe "logging and logging out", js: true do
  Capybara.app_host = "http://localhost:8080"
  Capybara.server_host = "localhost"
  Capybara.server_port = "8080"

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

