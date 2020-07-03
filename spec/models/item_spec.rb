require 'rails_helper'

describe Item do
  describe '#create' do
    # 1
    it "name、introduction、price、size、condition_id、deal_state、prefecture_id、preparation_day_id、postage_payer_id、が存在すれば登録できること" do
      item = build(:item)
      expect(item).to be_valid
    end
    
     # 2
     it "nameがない場合は登録できないこと" do
      item = build(:item, name: nil)
      item.valid?
      expect(item.errors[:name]).to include("can't be blank")
    end

     # 3
     it "introductionがない場合は登録できないこと" do
      item = build(:item, introduction: nil)
      item.valid?
      expect(item.errors[:introduction]).to include("can't be blank")
    end

     # 4
     it "priceがない場合は登録できないこと" do
      item = build(:item, price: nil)
      item.valid?
      expect(item.errors[:price]).to include("can't be blank")
    end

    # 5
    it "sizeがない場合は登録できないこと" do
      item = build(:item, size: nil)
      item.valid?
      expect(item.errors[:size]).to include("can't be blank")
    end

     # 6
     it "condition_idがない場合は登録できないこと" do
      item = build(:item, condition_id: nil)
      item.valid?
      expect(item.errors[:condition_id]).to include("can't be blank")
    end

     # 7
     it "deal_stateがない場合は登録できないこと" do
      item = build(:item, deal_state: nil)
      item.valid?
      expect(item.errors[:deal_state]).to include("can't be blank")
    end

     # 8
     it "prefecture_idがない場合は登録できないこと" do
      item = build(:item, prefecture_id: nil)
      item.valid?
      expect(item.errors[:prefecture_id]).to include("can't be blank")
    end

     # 9
     it "preparation_day_idがない場合は登録できないこと" do
      item = build(:item, preparation_day_id: nil)
      item.valid?
      expect(item.errors[:preparation_day_id]).to include("can't be blank")
    end

     # 10
     it "postage_payer_idがない場合は登録できないこと" do
      item = build(:item, postage_payer_id: nil)
      item.valid?
      expect(item.errors[:postage_payer_id]).to include("can't be blank")
    end

    # 11
    it "user_idがない場合は登録できないこと" do
      item = build(:item, user_id: nil)
      item.valid?
      expect(item.errors[:user]).to include("must exist")
    end

     # 12
     it "category_idがない場合は登録できないこと" do
      item = build(:item, category_id: nil)
      item.valid?
      expect(item.errors[:category]).to include("must exist")
    end

     # 13
     it "brand_idがない場合でも登録できること" do
      item = build(:item, brand_id: nil)
      expect(item).to be_valid
    end

  end
end


