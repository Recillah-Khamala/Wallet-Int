require 'rails_helper'

RSpec.describe "activities/edit", type: :view do
  let(:activity) {
    Activity.create!()
  }

  before(:each) do
    assign(:activity, activity)
  end

  it "renders the edit activity form" do
    render

    assert_select "form[action=?][method=?]", activity_path(activity), "post" do
    end
  end
end
