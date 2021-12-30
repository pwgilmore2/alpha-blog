class Author < ApplicationRecord
  validates :first_name, presence: true, length: {minimum: 2, maximum: 15}
  validates :last_name, presence: true, length: {minimum: 2, maximum: 15}
  validates :biography, presence: true, length: {minimum: 10, maximum: 300}
end
