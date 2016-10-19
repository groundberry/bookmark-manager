require 'spec_helper'
require './app/models/link'

feature "Viewing links" do
  scenario "existing links can be viewed on the page" do
    Link.create(url: "http://makersacademy.com", title: "Makers Academy")

    visit "/links"
    expect(page.status_code).to eq 200

    within "ul#links" do
      expect(page).to have_content("Makers Academy")
    end
  end
end
