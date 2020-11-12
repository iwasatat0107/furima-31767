class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  validates :image, presence: true
end
