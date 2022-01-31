require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)

    sleep 1
  end
  
  describe '購入機能' do
    context '内容に問題ない場合' do
      it "情報とtokenがあれば保存ができること" do
        expect(@order_address).to be_valid
      end
      it "建物名の記入がなくても登録できること" do
        @order_address.build = ''
        expect(@order_address).to be_valid
      end
    end
  
    context '内容に問題がある場合' do
      it "郵便番号が空では保存ができないこと" do
        @order_address.post_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code can't be blank")
      end
      it "郵便番号が「3桁ハイフン4桁」以外だと保存ができないこと" do
        @order_address.post_code = '1234-4567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code is invalid. Input full-width characters.")
      end
      it "郵便番号が全角文字列では保存ができないこと" do
        @order_address.post_code = '１２３ー４５６７'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code is invalid. Input full-width characters.")
      end
      it "都道府県が空では保存ができないこと" do
        @order_address.area_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Area can't be blank")
      end
      it "市町村が空では保存ができないこと" do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it "番地が空では保存ができないこと" do
        @order_address.address_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address number can't be blank")
      end
      it "電話番号が空では保存ができないこと" do
        @order_address.telephone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone number can't be blank")
      end
      it "電話番号が9桁以下では保存ができないこと" do
        @order_address.telephone_number = '080123456'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone number is invalid. Input half-width characters.")
      end
      it "電話番号が12桁以上では保存ができないこと" do
        @order_address.telephone_number = '123456789012'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone number is invalid. Input half-width characters.")
      end
      it "電話番号に半角数字以外が含まれている場合は購入できない" do
        @order_address.telephone_number = '12345678901こ'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone number is invalid. Input half-width characters.")
      end
      it '発送元の地域に「---」が選択されている場合は購入できない' do
        @order_address.area_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Area can't be blank")
      end
      it "tokenが空では登録できないこと" do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it "userが紐付いていなければ購入できない" do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it "itemが紐付いていなければ購入できない" do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
