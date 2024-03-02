require 'rails_helper'

RSpec.describe Foo, type: :model do
  subject(:foo) { described_class.new }
  # The rules:
  # You can't stub foo, it's the system under test
  # this spec shouldn't have to change if the contents of `Bar#yellow?` change
  #

  describe '#all_bars_yellow?' do
    context 'when there are no bars' do
      it 'returns false' do
        expect(foo.all_bars_yellow?).to eq false
      end
    end

    context 'when there are bars' do
      let(:first_bar) { Bar.new }
      let(:second_bar) { Bar.new }

      before do
        foo.bars = [first_bar, second_bar]
      end

      context 'when all bars are yellow' do
        before do
          allow(first_bar).to receive(:yellow?).and_return(true)
          allow(second_bar).to receive(:yellow?).and_return(true)
        end

        it 'returns true' do
          expect(foo.all_bars_yellow?).to be true
        end
      end

      context "when some bars aren't yellow" do
        before do
          allow(first_bar).to receive(:yellow?).and_return(true)
          allow(second_bar).to receive(:yellow?).and_return(false)
        end

        it 'returns false' do
          expect(foo.all_bars_yellow?).to eq false
        end
      end
    end
  end
end
