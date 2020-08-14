require 'rails_helper'
RSpec.describe Customer, type: :model do
  subject { Customer.new(first_name: "Jack", last_name: "Smith", phone: "8889995678", email: "jsmith@sample.com" )}
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "is not valid without a first_name" do
    subject.first_name=nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a last_name" do
    subject.last_name=nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a phone number" do
  subject.phone=nil
  expect(subject).to_not be_valid
  end
  it "is not valid without an email" do
  subject.email=nil
  expect(subject).to_not be_valid
  end
  it "is not valid if the phone number is not 10 chars" do
  subject.phone="123"
  expect(subject).to_not be_valid
  end
  it "is not valid if the phone number is not all digits" do
  subject.phone="123456789A"
  expect(subject).to_not be_valid
  end
  it "is not valid if the email address doesn't have a @" do
  subject.email="bobyahoo.com"
  expect(subject).to_not be_valid
  end
  it "returns the correct full_name" do
    expect(subject.full_name).to eq("Jack Smith")
  end
end

# Below shouldn't be here:
# That is request testing, and you don't put request testing in the models spec
# describe "get customers_path" do
#  it "renders the index view" do
# FactoryBot.create_list(:customer, 10)
# get customers_path
# expect(response.status).to eq(200)
# end
# end
