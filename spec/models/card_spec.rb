require 'rails_helper'

describe Card do
  describe '#pay' do
    it 'card情報が存在するとき登録できる' do
      user = create(:user)
      card = build(:card)
      expect(card).to be_valid
    end

    it 'customer_idが存在しないとき登録できない' do
      user = create(:user)
      card = build(:card, customer_id: "")
      card.valid?
      expect(card.errors[:customer_id]).to include("can't be blank")
    end

    it 'card_idが存在しないとき登録できない' do
      user = create(:user)
      card = build(:card, card_id: "")
      card.valid?
      expect(card.errors[:card_id]).to include("can't be blank")
    end

  end
end