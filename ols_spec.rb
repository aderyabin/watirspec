# encoding: utf-8
require File.expand_path("../spec_helper", __FILE__)

describe "Ols" do

  before :each do
    browser.goto(WatirSpec.url_for("non_control_elements.html"))
  end

  bug "http://github.com/jarib/celerity/issues#issue/25", :celerity do
    describe "with selectors" do
      it "returns the matching elements" do
        expect(browser.ols(:class => "chemistry").to_a).to eq [browser.ol(:class => "chemistry")]
      end
    end
  end

  describe "#length" do
    it "returns the number of ols" do
      expect(browser.ols.length).to eq 2
    end
  end

  describe "#[]" do
    it "returns the ol at the given index" do
      expect(browser.ols[0].id).to eq "favorite_compounds"
    end
  end

  describe "#each" do
    it "iterates through ols correctly" do
      count = 0

      browser.ols.each_with_index do |ol, index|
        expect(ol.id).to eq browser.ol(:index, index).id
        count += 1
      end

      expect(count).to be > 0
    end
  end

end
