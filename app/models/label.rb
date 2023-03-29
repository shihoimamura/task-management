class Label< ApplicationRecord
  has_many :labelings, dependent: :destroy
  has_many :tasks, through: :labelings

  scope :search_label, -> (label_id) { find_by(id: label_id).tasks }
end
