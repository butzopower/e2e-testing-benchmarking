def assert_clicking_increments_counter(number_of_clicks)
  Capybara.app_host = "http://localhost:8081"
  Capybara.server_host = "localhost"
  Capybara.server_port = "8081"

  context "when clicking #{number_of_clicks} times" do
    it "increments the counter that many times", js: true do
      visit "/button_test.html"

      number_of_clicks.times do |i|
        click_on "Increment"
        expect(page).to have_content (i + 1).to_s
      end

      expect(page).to have_content number_of_clicks.to_s
    end
  end
end