class Post < ApplicationRecord
  validates :title, presence: true, length: { in: 1..200 }
  validates :body, presence: true, length: { in: 5..2000 }
end
