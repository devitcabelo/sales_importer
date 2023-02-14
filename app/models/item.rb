class Item < ApplicationRecord
  belongs_to :purchaser
  belongs_to :purchase
  belongs_to :merchant
end
