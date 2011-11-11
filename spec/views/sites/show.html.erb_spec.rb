require 'spec_helper'

describe "sites/show.html.erb" do
  before(:each) do
    @site = assign(:site, stub_model(Site))
  end

  it "renders attributes in <p>" do
    render
  end
end
