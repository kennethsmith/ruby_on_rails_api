class Prompt < ApplicationRecord
    belongs_to :user

    validates :content, presence: true
    validates :tag, presence: true
  end