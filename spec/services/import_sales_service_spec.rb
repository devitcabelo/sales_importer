require 'rails_helper'

describe ImportSalesService do
  context "File structure matches table schema" do
    subject { described_class.new("public/tests/example_input.tab") }
    it "creates table rows with csv rows" do
      expect { subject.import }.to change { Purchase.all.size }.by(1)
    end
    it "match gross_income value" do
      expect(subject.import.gross_income).to eql(102.95)
    end
  end

  context "File structure doesn't matches table schema" do
    subject { described_class.new("public/tests/example_input_errors.tab") }
    it "raise exception when try to import csv file" do
      expect { subject.import }.to raise_exception(StandardError)
    end
  end
end