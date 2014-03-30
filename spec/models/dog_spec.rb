require 'spec_helper'

describe Dog do

  let(:valid_form) {{first_name: "Keith", last_name: "Dan", email: "keithdan@dankeith.com", dog_name: "puppiessmell"}}

  describe "validations" do

    it 'is valid with valid attributes' do
      expect(Dog.new(valid_form)).to be_valid
      expect(Dog.new(valid_form).errors).to be_blank
    end

    it 'is invalid if there is no first name' do
      invalid_form = Dog.new(valid_form.merge(first_name: ""))
      expect(invalid_form).to_not be_valid
      expect(invalid_form.errors).to_not be_blank
    end

    it 'is invalid if there is no last name' do
      invalid_form = Dog.new(valid_form.merge(last_name: ""))
      expect(invalid_form).to_not be_valid
      expect(invalid_form.errors).to_not be_blank
    end

    it 'is invalid if there is no email' do
      invalid_form = Dog.new(valid_form.merge(email: ""))
      expect(invalid_form).to_not be_valid
      expect(invalid_form.errors).to_not be_blank
    end

    it 'is invalid if there is no dog name' do
      invalid_form = Dog.new(valid_form.merge(dog_name: ""))
      expect(invalid_form).to_not be_valid
      expect(invalid_form.errors).to_not be_blank
    end

  end

  describe 'boundary condition validations' do

    it 'is invalid if there is email not in correct format' do
      invalid_form = Dog.new(valid_form.merge(email: "blurgger"))
      expect(invalid_form).to_not be_valid
      expect(invalid_form.errors).to_not be_blank
    end

    it 'is invalid if there is first name is numbers' do
      invalid_form = Dog.new(valid_form.merge(first_name: "123"))
      expect(invalid_form).to_not be_valid
      expect(invalid_form.errors).to_not be_blank
    end

    it 'is invalid if there is last name is numbers' do
      invalid_form = Dog.new(valid_form.merge(last_name: "123"))
      expect(invalid_form).to_not be_valid
      expect(invalid_form.errors).to_not be_blank
    end

    it 'is invalid if there is dog name is numbers' do
      invalid_form = Dog.new(valid_form.merge(dog_name: "123"))
      expect(invalid_form).to_not be_valid
      expect(invalid_form.errors).to_not be_blank
    end

    it 'is invalid if email is duplicate' do
      Dog.new(valid_form).save!
      invalid_form = Dog.new(valid_form)
      expect(invalid_form).to_not be_valid
      expect(invalid_form.errors).to_not be_blank
    end

  end

  describe 'instance methods' do

    it "can make a dog owner's full name" do
      dawg = Dog.new(valid_form)
      expect(dawg.full_name).to eq(dawg.first_name + " " + dawg.last_name)
    end

  end

end
