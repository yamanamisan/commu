class Comment < ApplicationRecord
  belongs_to :article
  has_many :votes, dependent: :destroy
  has_many :voters, through: :votes, source: :member

  validates :article, presence: true
  validates :name, presence: true
  validates :content, presence: true
  validates :name, length: { minimum: 2 }
  validates :name, length: { maximum: 20 }
  validates :content, length: { minimum: 1 }
  validates :content, length: { maximum: 150 }
end
