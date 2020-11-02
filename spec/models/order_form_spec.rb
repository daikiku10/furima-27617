require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  describe '購入先住所の保存' do
    before do
      @order_form = FactoryBot.build(:order_form)
    end

    it 'すべての値が正しく入力されていれば保存ができる' do
      expect(@order_form).to be_valid
    end

    it 'postal_codeが空だと保存できない' do
      @order_form.postal_code = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Postal code can't be blank")
    end

    it 'postal_codeにハイフンがないと保存ができない' do
      @order_form.postal_code = "1234567"
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end

    it 'prefecture_idが空だと保存ができない' do
      @order_form.prefecture_id = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Prefecture can't be blank")
    end

    it 'prefecture_idが 0 だと保存ができない' do
      @order_form.prefecture_id = 0
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Prefecture Select")
    end

    it 'cityが空だと保存ができない' do
      @order_form.city = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("City can't be blank")
    end

    it 'house_numberが空だと保存ができない' do
      @order_form.house_number = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("House number can't be blank")
    end

    it 'building_nameが空でも保存ができる' do
      @order_form.building_name = nil
      expect(@order_form).to be_valid
    end

    it 'phone_numberが空だと保存ができない' do
      @order_form.phone_number = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Phone number can't be blank")
    end

    it 'phone_numberにハイフンがあると保存ができない' do
      @order_form.phone_number = '090-1234-5678'
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Phone number input only number")
    end

    it 'phone_numberが12桁以上だと保存ができない' do
      @order_form.phone_number = '090123456789'
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Phone number input only number")
    end
  end
end
