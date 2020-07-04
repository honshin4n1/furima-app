require 'rails_helper'

describe SendingDestination do
  describe '#create_sending_destination' do
    # 1
    it "first_name、family_name、first_name_kana、family_name_kana、post_code、prefecture、city、house_numberが存在すれば登録できること" do
      sending_destination = build(:sending_destination)
      expect(sending_destination).to be_valid
    end

    # 2
    it "first_nameがない場合は登録できないこと" do
      sending_destination = build(:sending_destination, first_name: nil)
      sending_destination.valid?
      expect(sending_destination.errors[:first_name]).to include("can't be blank")
    end

    # 3
    it "family_nameがない場合は登録できないこと" do
      sending_destination = build(:sending_destination, family_name: nil)
      sending_destination.valid?
      expect(sending_destination.errors[:family_name]).to include("can't be blank")
    end

    # 4
    it "first_name_kanaがない場合は登録できないこと" do
      sending_destination = build(:sending_destination, first_name_kana: nil)
      sending_destination.valid?
      expect(sending_destination.errors[:first_name_kana]).to include("can't be blank")
    end

    # 5
    it "family_nameがない場合は登録できないこと" do
      sending_destination = build(:sending_destination, family_name_kana: nil)
      sending_destination.valid?
      expect(sending_destination.errors[:family_name_kana]).to include("can't be blank")
    end

    # 6
    it "post_codeがない場合は登録できないこと" do
      sending_destination = build(:sending_destination, post_code: nil)
      sending_destination.valid?
      expect(sending_destination.errors[:post_code]).to include("can't be blank")
    end

    # 7
    it "prefectureがない場合は登録できないこと" do
      sending_destination = build(:sending_destination, prefecture: nil)
      sending_destination.valid?
      expect(sending_destination.errors[:prefecture]).to include("can't be blank")
    end

    # 8
    it "cityがない場合は登録できないこと" do
      sending_destination = build(:sending_destination, city: nil)
      sending_destination.valid?
      expect(sending_destination.errors[:city]).to include("can't be blank")
    end

    # 9
    it "house_numberがない場合は登録できないこと" do
      sending_destination = build(:sending_destination, house_number: nil)
      sending_destination.valid?
      expect(sending_destination.errors[:house_number]).to include("can't be blank")
    end

     # 10
     it "post_codeが000-0000のタイプであれば登録できること" do
      sending_destination = build(:sending_destination, post_code: "800-1000")
      expect(sending_destination).to be_valid
    end

     # 11
     it "post_codeが000-0000のタイプでなければ登録できないこと" do
      sending_destination = build(:sending_destination, post_code: "8001000")
      sending_destination.valid?
      expect(sending_destination.errors[:post_code]).to include("is invalid")
     end

     # 12
    it "phone_numberが存在しなくても登録できること" do
      sending_destination = build(:sending_destination, phone_number: nil)
      expect(sending_destination).to be_valid
    end

     # 13
     it "重複したphone_numberが存在する場合は登録できないこと" do
      sending_destination = create(:sending_destination)
      another_sending_destination = build(:sending_destination, phone_number: sending_destination.phone_number)
      another_sending_destination.valid?
      expect(another_sending_destination.errors[:phone_number]).to include("has already been taken")
     end
  end
end

