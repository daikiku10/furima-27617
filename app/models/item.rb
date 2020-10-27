class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_burden
  belongs_to_active_hash :delivery_area
  belongs_to_active_hash :delivery_day

  belongs_to :user
end
