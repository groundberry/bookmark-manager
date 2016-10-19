feature 'Adding tags' do

  scenario 'I can add a single tag to a new link' do
    visit '/links/new'
    fill_in('url', with: 'https://github.com')
    fill_in('title', with: 'GitHub')
    fill_in('tags', with: 'development')

    click_button('Add link')
    link = Link.first
    expect(link.tags.map(&:name)).to include('development')
  end
end
