class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :password, format: {with: /\A(?=.*?[a-z])[a-z\d]+\z/, message: "英数字を必ず含めてください"}
  validates :nickname, presence: true
  validates :last_name, presence: true, format: {with: /\A[ぁ-んァ-ンー-龥]/, message: "全角で入力してください！"}
  validates :first_name, presence: true, format: {with: /\A[ぁ-んァ-ンー-龥]/, message: "全角で入力してください！"}
  validates :last_name_kana, presence: true, format: {with: /\A[ァ-ヶー-]+\z/, message: "全角（カタカナ）で入力してください！"}
  validates :first_name_kana, presence:true, format: {with: /\A[ァ-ヶー-]+\z/, message: "全角（カタカナ）で入力してください！"}
  validates :birthday, presence: true
end
