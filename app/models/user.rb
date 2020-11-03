class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :password, format: {with: /\A(?=.*?[a-z])[a-z\d]+\z/, message: "英数字を必ず含めてください"}
  with_options presence: true do
    validates :nickname
    validates :last_name, format: {with: /\A[ぁ-んァ-ンー-龥]/, message: "全角で入力してください！"}
    validates :first_name, format: {with: /\A[ぁ-んァ-ンー-龥]/, message: "全角で入力してください！"}
    validates :last_name_kana, format: {with: /\A[ァ-ヶー-]+\z/, message: "全角（カタカナ）で入力してください！"}
    validates :first_name_kana, format: {with: /\A[ァ-ヶー-]+\z/, message: "全角（カタカナ）で入力してください！"}
    validates :birthday
  end

  has_many :items
  has_many :orders
end
