require 'spec_helper'

# As a dog owner
# I want to register my dog
# So that I can connect with other dog lovers

# Acceptance Criteria:
# An owner must specify their first name, last name, email address, and dog's name.
# Upon adding my entry, I can see a list of other registered dog owners.
# An owner's full_name can be requested. Hint: This will require an instance method

describe 'dog owner registration' do

  before :each do
    visit('/dogs/new')
  end

  describe 'labels exist and are awesome' do

    it 'has a proper title for dog application' do
      expect(page).to have_content('Who Let ze Dogz Out')
      # here is a save_and_open_page that should never make it to production, derp, coding fail.
    end

    it 'has a first name field' do
      expect(page).to have_content('First name:')
    end

    it 'has a last name field' do
      expect(page).to have_content('Last name:')
    end

    it 'has a email field' do
      expect(page).to have_content('Email:')
    end

    it 'has a dog name field' do
      expect(page).to have_content('Dog name:')
    end

  end

  describe 'dog owner can register dog with all the proper information and feels good that his only friend is a puppy' do

    describe 'the dog owner is a magical genius and gets to see other dog owners like Faizaan the wiz kid' do

      it 'takes you to the show page when you submit valid form' do
        fill_in "dog[email]", with: "indahouse@gmail.com"
        fill_in "dog[dog_name]", with: "unixdasuperiortolinux"
        fill_in "dog[first_name]", with: 'Ali'
        fill_in "dog[last_name]", with: 'gberg'

        click_on "Who Who Who?"

        expect(page).to have_content('You let the dogz out')
      end

      it 'will show all the dog owner info back on the home page' do
        fill_in "dog[email]", with: "indahouse@gmail.com"
        fill_in "dog[dog_name]", with: "unixdasuperiortolinux"
        fill_in "dog[first_name]", with: 'Ali'
        fill_in "dog[last_name]", with: 'gberg'

        click_on "Who Who Who?"

        expect(page).to have_content('Ali')
        expect(page).to have_content('gberg')
        expect(page).to have_content('unixdasuperiortolinux')
        expect(page).to have_content('indahouse@gmail.com')
      end

    end

    describe 'dog owner is stupid and forgets to fill in blank because he is petting his dog too much' do

      it 'throws an error when email is blank' do
        fill_in "dog[email]", with: ""
        fill_in "dog[dog_name]", with: "unixdasuperiortolinux"
        fill_in "dog[first_name]", with: 'Ali'
        fill_in "dog[last_name]", with: 'gberg'

        click_on "Who Who Who?"

        expect(page).to have_content("can't be blank")
      end

      it 'throws an error when dog name is blank' do
        fill_in "dog[email]", with: "indahouse@gmail.com"
        fill_in "dog[dog_name]", with: ""
        fill_in "dog[first_name]", with: 'Ali'
        fill_in "dog[last_name]", with: 'gberg'

        click_on "Who Who Who?"

        expect(page).to have_content("can't be blank")
      end

      it 'throws an error when first name is blank' do
        fill_in "dog[email]", with: "indahouse@gmail.com"
        fill_in "dog[dog_name]", with: "unixdasuperiortolinux"
        fill_in "dog[first_name]", with: ''
        fill_in "dog[last_name]", with: 'gberg'

        click_on "Who Who Who?"

        expect(page).to have_content("can't be blank")
      end

      it 'throws an error when last name is blank' do
        fill_in "dog[email]", with: "indahouse@gmail.com"
        fill_in "dog[dog_name]", with: "unixdasuperiortolinux"
        fill_in "dog[first_name]", with: 'Ali'
        fill_in "dog[last_name]", with: ''

        click_on "Who Who Who?"

        expect(page).to have_content("can't be blank")
      end

    end

    describe 'dog owner get error because he is trying to spam you with evil Faizaan magic' do

      it 'throws an error when email is invalid' do
        fill_in "dog[email]", with: ""
        fill_in "dog[dog_name]", with: "unixdasuperiortolinux"
        fill_in "dog[first_name]", with: 'Ali'
        fill_in "dog[last_name]", with: 'gberg'

        click_on "Who Who Who?"

        expect(page).to have_content("can't be blank")

      end

      it 'throws an error when dog name is invalid' do
        fill_in "dog[email]", with: "indahouse@gmail.com"
        fill_in "dog[dog_name]", with: ""
        fill_in "dog[first_name]", with: 'Ali'
        fill_in "dog[last_name]", with: 'gberg'

        click_on "Who Who Who?"

        expect(page).to have_content("invalid")

      end

      it 'throws an error when first name is invalid' do
        fill_in "dog[email]", with: "indahouse@gmail.com"
        fill_in "dog[dog_name]", with: "unixdasuperiortolinux"
        fill_in "dog[first_name]", with: ''
        fill_in "dog[last_name]", with: 'gberg'

        click_on "Who Who Who?"

        expect(page).to have_content("invalid")

      end

      it 'throws an error when last name is invalid' do
        fill_in "dog[email]", with: "indahouse@gmail.com"
        fill_in "dog[dog_name]", with: "unixdasuperiortolinux"
        fill_in "dog[first_name]", with: 'Ali'
        fill_in "dog[last_name]", with: ''

        click_on "Who Who Who?"

        expect(page).to have_content("invalid")
      end

    end

  end




end
