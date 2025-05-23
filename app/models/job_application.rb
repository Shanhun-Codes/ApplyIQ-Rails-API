class JobApplication < ApplicationRecord
  has_one :resume, dependent: :destroy
  has_one :cover_letter, dependent: :destroy
  has_one :ai_insight, dependent: :destroy
  has_one :email_tracking, dependent: :destroy
  belongs_to :user
end
