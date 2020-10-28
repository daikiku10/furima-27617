class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_burden
  belongs_to_active_hash :delivery_area
  belongs_to_active_hash :delivery_day


  with_options presence: true do
    validates :image
    validates :name
    validates :explain
    validates :price, numericality: { only_integer: true, greater_than: 300, less_than: 9999999, message: "Out of setting range"}, format: {with: /\A[0-9]+\z/, message: "Half-width number"}
    validates :category
    validates :status_id
    validates :delivery_burden_id
    validates :delivery_area_id
    validates :delivery_day_id
  end

  with_options numericality: { other_than: 1, message: 'Select'} do
    validates :category_id
    validates :status_id
    validates :delivery_burden_id
    validates :delivery_area_id
    validates :delivery_day_id
  end

end
