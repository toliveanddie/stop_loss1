class Stock < ApplicationRecord
  validates :name, presence: true
  validates :entry, presence: true
  validates :stop_loss, presence: true
end
