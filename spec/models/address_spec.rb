require 'rails_helper'

RSpec.describe Address, type: :model do
  before do
    @address = FactoryBot.build(:address)
  end
  
  describe '購入機能' do
    context '内容に問題ない場合' do
      it "情報とtokenがあれば保存ができること" do
        expect(@address).to be_valid
      end
    end
  
    context '内容に問題がある場合' do
      it "クレジットカード番号が空では保存ができないこと" do
        @address.number = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("Number can't be blank")
      end
      it "クレジットカードの有効期限（月）が空では保存ができないこと" do
        @address.exp_month = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("Exp month can't be blank")
      end
      it "クレジットカードの有効期限（年）が空では保存ができないこと" do
        @address.exp_year = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("Exp year can't be blank")
      end
      it "クレジットカードのセキュリティコードが空では保存ができないこと" do
        @address.cvc = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("Cvc can't be blank")
      end
      it "郵便番号が空では保存ができないこと" do
        @address.post_code = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("Post code can't be blank")
      end
      it "郵便番号が「3桁ハイフン4桁」以外だと保存ができないこと" do
        @address.post_code = '1234-4567'
        @address.valid?
        expect(@address.errors.full_messages).to include("Post code is invalid")
      end
      it "郵便番号が全角文字列では保存ができないこと" do
        @address.post_code = '１２３ー４５６７'
        @address.valid?
        expect(@address.errors.full_messages).to include("Post code is invalid")
      end
      it "都道府県が空では保存ができないこと" do
        @address.area_id = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("Area can't be blank")
      end
      it "市町村が空では保存ができないこと" do
        @address.city = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("City can't be blank")
      end
      it "番地が空では保存ができないこと" do
        @address.address_number = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("Address number can't be blank")
      end
      it "電話番号が空では保存ができないこと" do
        @address.telephone_number = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("Telephone number can't be blank")
      end
      it "電話番号が9桁以下では保存ができないこと" do
        @address.telephone_number = '080123456'
        @address.valid?
        expect(@address.errors.full_messages).to include("Telephone number is too short (minimum is 10 characters)")
      end
      it "電話番号が12桁以上では保存ができないこと" do
        @address.telephone_number = '123456789012'
        @address.valid?
        expect(@address.errors.full_messages).to include("Telephone number is invalid")
      end
      it "tokenが空では登録できないこと" do
        @address.token = nil
        @address.valid?
        expect(@address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
