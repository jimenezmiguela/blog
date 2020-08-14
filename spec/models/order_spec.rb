require 'rails_helper'

RSpec.describe Order, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  subject { Order.new( product_name: "gears", product_count: 7, customer: FactoryBot.create(:customer))}
it "is valid with valid attributes" do;
  expect(subject).to be_valid
end
it "is not valid with out a product_name" do
  subject.product_name = nil
  expect(subject).to_not be_valid
end
it "is not valid with out a product_count" do
  subject.product_count = nil
  expect(subject).to_not be_valid
end
it "is not valid with out a customer" do
  subject.customer = nil
  expect(subject).to_not be_valid
end
it "is not valid with out a valid customer_id" do
  subject.customer_id = 9999
  expect(subject).to_not be_valid
end
end
