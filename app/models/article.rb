class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  validates :title, presence: true
  validates :editor, presence: true
  validates :title, length: { minimum: 2 }
  validates :title, length: { maximum: 20 }
  validates :editor, length: { minimum: 2 }
  validates :editor, length: { maximum: 10 }
end
