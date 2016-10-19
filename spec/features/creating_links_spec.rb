require 'spec_helper'
require './app/models/link'

feature "Creating links" do
  scenario "a new link can be added to the bookmark" do
    visit "/links/new"
    fill_in('title', with: 'Sinatra')
    fill_in('url', with: 'http://www.sinatrarb.com/')
    click_button('Add link')

    expect(current_path).to eq '/links'

    within "ul#links" do
      expect(page).to have_content('Sinatra')
    end
  end
end
