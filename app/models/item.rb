class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :order, dependent: :destroy
  has_one :address, through: :order, dependent: :destroy
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :prefecture
  belongs_to :scheduled_delivery
  belongs_to :delivery_charge

  validates :name, presence: true
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :status_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :information, presence: true
  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :scheduled_delivery_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_charge_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :image, presence: true
  def was_attached?
    image.attached?
  end
end
