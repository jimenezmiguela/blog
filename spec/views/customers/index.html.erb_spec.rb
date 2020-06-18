require 'rails_helper'

RSpec.describe "customers/index", type: :view do
  before(:each) do
    assign(:customers, [
      Customer.create!(
        first_name: "First Name",
        last_name: "Last Name",
        phone: "Phone",
        email: "Email"
      ),
      Customer.create!(
        first_name: "First Name",
        last_name: "Last Name",
        phone: "Phone",
        email: "Email"
      )
    ])
  end

  it "renders a list of customers" do
    render
    assert_select "tr>td", text: "First Name".to_s, count: 2
    assert_select "tr>td", text: "Last Name".to_s, count: 2
    assert_select "tr>td", text: "Phone".to_s, count: 2
    assert_select "tr>td", text: "Email".to_s, count: 2
  end
end
