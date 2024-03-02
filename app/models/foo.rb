class Foo < ApplicationRecord
  has_many :bars, dependent: :destroy

  def all_bars_yellow?
    bars.all?(&:yellow?)
  end
end
