require 'spec_helper'

describe "keywords/new" do
  before(:each) do
    assign(:keyword, stub_model(Keyword,
      :site_id => 1,
      :word => "MyString"
    ).as_new_record)
  end

  it "renders new keyword form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", keywords_path, "post" do
      assert_select "input#keyword_site_id[name=?]", "keyword[site_id]"
      assert_select "input#keyword_word[name=?]", "keyword[word]"
    end
  end
end
