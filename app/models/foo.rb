class Foo < ApplicationRecord
  has_many :bars, dependent: :destroy
end
