require 'rails_helper'

RSpec.describe Foo, type: :model do
  subject(:foo) { described_class.new }
  # The rules:
  # You can't stub foo, it's the system under test
  # this spec shouldn't have to change if the contents of `Bar#yellow?` change
  describe "#all_bars_yellow?" do 
    context "when all bars are yellow" do 
      it "returns true" do
        expect(foo.all_bars_yellow?).to be true
      end
    end

    context "when some bars aren't yellow" do 
      it "returns false" do
        expect(foo.all_bars_yellow?).to be false
      end
    end

  end
end
