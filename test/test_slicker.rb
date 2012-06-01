require 'helper'

describe "Sanitizing params input" do
  describe "given a string" do
    before do
      @params = "<a href='foo'>bar</a>"
    end

    it "should get rid of all html" do
      assert_equal("bar", Slicker.protect(@params))
    end
  end

  describe "given an array of strings" do
    before do
      @params = ["<a href='foo'>foo</a>", "<strong>bar</strong>"]
    end

    it "should walk the array and get rid of all html" do
      assert_equal(["foo", "bar"], Slicker.protect(@params))
    end
  end

  describe "given a hash" do
    before do
      @params = { :foo => "<strong>foo</strong>" }
    end

    it "should walk the hash and get rid of all html" do
      assert_equal({ :foo => "foo" }, Slicker.protect(@params))
    end
  end

  describe "with a more mixed data structure" do
    before do
      @params = { 
        :foo => ["<strong>foo</strong>", 
          :fapp => { :fapp => "<b>fapp</b>"}], 
        :bar => { :baz => "<strong>baz</strong>" },
        :blap => [["<b>blap</b>"]]
      }
    end

    it "should still get rid of all html" do
      assert_equal(
      { :foo => ["foo", 
          :fapp => { :fapp => "fapp" }], 
        :bar => { :baz => "baz" },
        :blap => [["blap"]]
      }, Slicker.protect(@params))
    end
  end

end
