class Vote < ApplicationRecord
  belongs_to :comment
  belongs_to :member

  validate do
    unless member && member.votable_for?(comment)
      errors.add(:base, :invalid)
    end
  end
end
