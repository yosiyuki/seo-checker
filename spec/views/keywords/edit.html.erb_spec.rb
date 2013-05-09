require 'spec_helper'

describe "keywords/edit" do
  before(:each) do
    @keyword = assign(:keyword, stub_model(Keyword,
      :site_id => 1,
      :word => "MyString"
    ))
  end

  it "renders the edit keyword form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", keyword_path(@keyword), "post" do
      assert_select "input#keyword_site_id[name=?]", "keyword[site_id]"
      assert_select "input#keyword_word[name=?]", "keyword[word]"
    end
  end
end
