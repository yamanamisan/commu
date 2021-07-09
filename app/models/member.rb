class Member < ApplicationRecord
  has_secure_password

  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :voted_comments, through: :votes, source: :comment

  validates :name, presence: true,
   format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々]|[a-z0-9])+\z/ , allow_blank: true ,message: :invalid_member_name},
   length: { minimum: 2, maximum: 10, allow_blank: true},
   uniqueness: { case_sensitive: false }
 validates :email, email: { allow_blank:true }

  enum department:{
    "---":0,
    人文学部:1,教育学部:2,経済学部:3,理学部:4,医学部:5,工学部:6,農学部:7,共同獣医学部:8,国際総合科学部:9,大学院:10,その他:11
  }

  def votable_for?(comment)
    comment && !votes.exists?(comment_id: comment.id)
  end

  class << self
    def search(query)
       rel = order("department") #学部カラムでソートするRO
       if query.present? #検索ワードアリならユーザ名から検索
         rel = rel.where("name LIKE ?","%#{query}%")
       end
      rel
    end
  end

  attr_accessor :current_password
  validates :password, presence: { if: :current_password }

end
