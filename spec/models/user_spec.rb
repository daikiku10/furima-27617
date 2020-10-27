require 'rails_helper'

RSpec.describe User, type: :model do
  describe '新規登録の保存' do
    before do
      @user = FactoryBot.build(:user)
    end

    it "すべての値が入力されていれば登録できる" do
      expect(@user).to be_valid
    end
    it "nicnameが空だと登録できない" do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "emailが空だと登録ができない" do
      @user.email =nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "emailに@がないと登録ができない" do
      @user.email = "samplesample.com"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it "重複したemailが存在する場合登録ができない" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it "passwordが空だと登録ができない" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "passwordが6文字以上の半角英数字であれば登録できる" do
      @user.password = "1234aa"
      @user.password_confirmation = "1234aa"
      expect(@user).to be_valid
    end

    it "passwordが5文字以下であれば登録できない" do
      @user.password = "123aa"
      @user.password_confirmation = "123aa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it "passwordとpassword_confirmationが不一致では登録できない" do
      @user.password = "1234aa"
      @user.password_confirmation = "12345aa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "passwordに半角英数字が含まれていないと登録できない" do
      @user.password = "123456"
      @user.password_confirmation = "123456"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password 英数字を必ず含めてください")
    end

    it "last_nameが空だと登録できない" do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank","Last name 全角で入力してください！")
    end

    it "last_nameが半角では登録できない" do
      @user.last_name = "ｱｲｳｴｵ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name 全角で入力してください！")
    end

    it "first_nameが空だと登録できない" do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank","First name 全角で入力してください！")
    end

    it "first_nameが半角では登録できない" do
      @user.first_name = "ｱｲｳｴｵ"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name 全角で入力してください！")
    end

    it "last_name_kanaが空だと登録できない" do
      @user.last_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank", "Last name kana 全角（カタカナ）で入力してください！")
    end

    it "last_name_kanaが半角では登録できない" do
      @user.last_name_kana = "ｱｲｳｴｵ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana 全角（カタカナ）で入力してください！")
    end

    it "last_name_kanaがカタカナ以外では登録できない" do
      @user.last_name_kana = "一二三"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana 全角（カタカナ）で入力してください！")
    end

    it "first_name_kanaが空だと登録できない" do
      @user.first_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank", "First name kana 全角（カタカナ）で入力してください！")
    end

    it "first_name_kanaが半角では登録できない" do
      @user.first_name_kana = "ｱｲｳｴｵ"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana 全角（カタカナ）で入力してください！")
    end

    it "first_name_kanaがカタカナ以外では登録できない" do
      @user.first_name_kana = "一二三"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana 全角（カタカナ）で入力してください！")
    end

    it "birthdayが空だと登録できない" do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
