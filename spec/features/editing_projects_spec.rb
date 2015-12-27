require "rails_helper"

RSpec.feature "Users can edit existing projects" do
  before do
    FactoryGirl.create(:project,name: "Atom")
    visit "/"
    click_link "Atom"
    click_link "Edit Project"

  end
  scenario 'with valid attributes' do

    fill_in "Name", with: "Atom Final Release"
    click_button "Update Project"

    expect(page).to have_content "Project has been updated."
    expect(page).to have_content "Atom Final Release"
  end
  scenario 'with invalid attributes' do

    fill_in "Name", with: ""
    click_button "Update Project"

    expect(page).to have_content "Project has not been updated."
  end
end
