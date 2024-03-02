class Bar < ApplicationRecord
  belongs_to :foo

  def yellow?
    (id % 3).zero?
  end
end
