class Foo < ApplicationRecord
  has_many :bars, dependent: :destroy

  def all_bars_yellow?
    return false if bars.empty?

    bars.all?(&:yellow?)
  end
end
