class Task < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true

  scope :search_title, -> (title){ where('title like ?',"%#{title}%") }
  scope :search_status, -> (status){ where(status: status) }
  scope :search_priority, -> (priority){ where(priority: priority) }

end
