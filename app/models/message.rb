class Message < ApplicationRecord
  validates :sender, :receiver, :content, presence: true
end
