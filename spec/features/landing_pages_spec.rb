require 'rails_helper'

RSpec.feature "LandingPages", type: :feature do
  context 'Going to website' do
    Steps 'Seeing apartments' do
      Given 'I am on the landing page' do
        visit '/'
      end
      Then 'I can see a list of aparments' do
        expect(page).to have_content("Street Latitude Longitude City Zip State Country Name Phone Hours contact")
      end
    end
  end

  context 'Make an apartment' do
    Steps 'For making an aparment' do
      Given 'That I am on the apartment page' do
        visit "/"
      end
      Then 'I can click New Apartment' do
        click_link 'New Apartment'
      end
      And 'I am taken to a page that makes the apartment' do
        expect(page).to have_content 'New Apartment'
        fill_in 'Street', with: '406 9th Ave'
        fill_in 'Latitude', with: '32.71'
        fill_in 'Longitude', with: '-117.16'
        fill_in 'City', with: 'San Diego'
        fill_in 'Zip', with: '92101'
        fill_in 'State', with: 'CA'
        fill_in 'Country', with: 'USA'
        fill_in 'Name', with: 'Sarah'
        fill_in 'Phone', with: '654-235-1245'
        fill_in 'Hours contact', with: '9am-5pm'
        click_button 'Create Apartment'
      end
      Then 'I see my animal' do
        expect(page).to have_content("Apartment was successfully created.")
        expect(page).to have_content("406 9th Ave")
        expect(page).to have_content("San Diego")
        expect(page).to have_content("Sarah")
      end
    end
  end

  context "See all apartments in database" do
    Steps "for seeing a list of apartments" do
      Given "that I am on the new apartment page" do
        visit "/apartments/new"
      end
      Then "I can create an apartment" do
        expect(page).to have_content 'New Apartment'
        fill_in 'Street', with: '406 9th Ave'
        fill_in 'Latitude', with: '32.71'
        fill_in 'Longitude', with: '-117.16'
        fill_in 'City', with: 'San Diego'
        fill_in 'Zip', with: '92101'
        fill_in 'State', with: 'CA'
        fill_in 'Country', with: 'USA'
        fill_in 'Name', with: 'Sarah'
        fill_in 'Phone', with: '654-235-1245'
        fill_in 'Hours contact', with: '9am-5pm'
        click_button 'Create Apartment'
      end
      Then "I can click back to make another apartment" do
        click_link 'Back'
        click_link 'New Apartment'
      end
      Then "I can create an apartment" do
        expect(page).to have_content 'New Apartment'
        fill_in 'Street', with: '3335 Piragua St'
        fill_in 'Latitude', with: '33.09'
        fill_in 'Longitude', with: '-117.23'
        fill_in 'City', with: 'Carlsbad'
        fill_in 'Zip', with: '92009'
        fill_in 'State', with: 'CA'
        fill_in 'Country', with: 'USA'
        fill_in 'Name', with: 'Kelly'
        fill_in 'Phone', with: '344-123-1241'
        fill_in 'Hours contact', with: '9am-6pm'
        click_button 'Create Apartment'
      end
      Then "I can see my apartments in a list" do
        click_link 'Back'
        expect(page).to have_content("406 9th Ave 32.71 -117.16")
        expect(page).to have_content("3335 Piragua St 33.09 -117.23")
      end
    end
  end

context "Update an apartment in database" do
  Steps "for updating an apartment" do
    Given "that I am on the new apartment page" do
      visit "/apartments/new"
    end
    Then "I can create an apartment" do
      expect(page).to have_content 'New Apartment'
      fill_in 'Street', with: '406 9th Ave'
      fill_in 'Latitude', with: '32.71'
      fill_in 'Longitude', with: '-117.16'
      fill_in 'City', with: 'San Diego'
      fill_in 'Zip', with: '92101'
      fill_in 'State', with: 'CA'
      fill_in 'Country', with: 'USA'
      fill_in 'Name', with: 'Sarah'
      fill_in 'Phone', with: '654-235-1245'
      fill_in 'Hours contact', with: '9am-5pm'
      click_button 'Create Apartment'
    end
    Then "I can edit the apartment" do
      click_link 'Edit'
      fill_in 'Name', with: 'Rachel'
      click_button 'Update Apartment'
    end
    Then "I can see the updated apartment" do
      expect(page).to have_content("Apartment was successfully updated.")
      expect(page).to have_content("Rachel")
    end
  end
end
context "Destroy an apartment in database" do
    Steps "for destroying an apartment" do
      Given "that I am on the new apartment page" do
        visit "/apartments/new"
      end
      Then "I can create an apartment" do
        expect(page).to have_content 'New Apartment'
        fill_in 'Street', with: '406 9th Ave'
        fill_in 'Latitude', with: '32.71'
        fill_in 'Longitude', with: '-117.16'
        fill_in 'City', with: 'San Diego'
        fill_in 'Zip', with: '92101'
        fill_in 'State', with: 'CA'
        fill_in 'Country', with: 'USA'
        fill_in 'Name', with: 'Sarah'
        fill_in 'Phone', with: '654-235-1245'
        fill_in 'Hours contact', with: '9am-5pm'
        click_button 'Create Apartment'
      end
      Then "I can destroy the apartment" do
        click_link 'Back'
        click_link 'Destroy'

      end
      Then "I can no longer see the apartment" do
        expect(page).to have_no_content("406 9th Ave 32.71 -117.16")
      end
    end
  end

end
