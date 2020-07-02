require 'rails_helper'
describe Profile do
  describe '#create' do
    # 1
    it "first_name、family_name、first_name_kana、family_name_kana、year、month、dayが存在すれば登録できること" do
      profile = build(:profile)
      expect(profile).to be_valid
    end

     # 2
     it "first_nameがない場合は登録できないこと" do
      profile = build(:profile, first_name: nil)
      profile.valid?
      expect(profile.errors[:first_name]).to include("can't be blank")
    end

     # 3
     it "family_nameがない場合は登録できないこと" do
      profile = build(:profile, family_name: nil)
      profile.valid?
      expect(profile.errors[:family_name]).to include("can't be blank")
    end

    # 4
    it "first_name_kanaがない場合は登録できないこと" do
      profile = build(:profile, first_name_kana: nil)
      profile.valid?
      expect(profile.errors[:first_name_kana]).to include("can't be blank")
    end

     # 5
     it "family_name_kanaがない場合は登録できないこと" do
      profile = build(:profile, family_name_kana: nil)
      profile.valid?
      expect(profile.errors[:family_name_kana]).to include("can't be blank")
    end

    # 6
    it "yearがない場合は登録できないこと" do
      profile = build(:profile, year: nil)
      profile.valid?
      expect(profile.errors[:year]).to include("can't be blank")
    end

     # 7
     it "monthがない場合は登録できないこと" do
      profile = build(:profile, month: nil)
      profile.valid?
      expect(profile.errors[:month]).to include("can't be blank")
    end

    # 7
    it "dayがない場合は登録できないこと" do
      profile = build(:profile, day: nil)
      profile.valid?
      expect(profile.errors[:day]).to include("can't be blank")
    end

    # 8
    it "first_name、family_nameが全角であれば登録できること" do
      profile = build(:profile, first_name: "太郎", family_name: "山田")
      expect(profile).to be_valid
    end

    # 9
    it "first_name_kana、family_name_kanaが全角カナであれば登録できること" do
      profile = build(:profile, first_name_kana: "タロウ", family_name_kana: "ヤマダ")
      expect(profile).to be_valid
    end

    # 10
    it "first_name、family_nameが全角でなければ登録できないこと" do
      profile = build(:profile, first_name: "Taro", family_name: "Yamada")
      profile.valid?

    end

    # 11
    it "first_name_kana、family_name_kanaが全角カナでなければ登録できないこと" do
      profile = build(:profile, first_name_kana: "たろう", family_name_kana: "やまだ")
      profile.valid?
    end
  end
end

