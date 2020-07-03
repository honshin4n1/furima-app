require 'rails_helper'

describe ItemImage do
  describe '#create' do
    # 1
    it "imageが存在すれば登録できること" do
      item_image = build(:item_image)
      expect(item_image).to be_valid
    end

    # 2
    it "imageがない場合は登録できないこと" do
      item_image = build(:item_image, image: nil)
      item_image.valid?
      expect(item_image.errors[:image]).to include("can't be blank")
    end
  end
end

