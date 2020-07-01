class CardsController < ApplicationController
  require "payjp"  

  # カードの登録画面。登録ボタンを押すとcreateアクションへ。
  def new
    card = Card.find_by(user_id: "1") #current_user.id
    redirect_to action: "show" if card.present? #カード情報が存在していたらshowへ
  end

  #PayjpとCardのデータベースを作成
  def pay 
    Payjp.api_key =ENV['PAYJP_PRIVATE_KEY']
    if params['payjp-token'].blank?
      redirect_to action: "new" #空ならnewへ
    else
      # トークンが正常に発行されていたら、顧客情報をPAY.JPに登録します。
      customer = Payjp::Customer.create(
        description: 'test', # 無くてもOK。PAY.JPの顧客情報に表示する概要です。
        card: params['payjp-token'], # 直前のnewアクションで発行され、送られてくるトークンをここで顧客に紐付けて永久保存します。
        metadata: {user_id: "1"} #current_user.id
      )
      @card = Card.new(user_id: "1", customer_id: customer.id, card_id: customer.default_card) #current_user.id
      if @card.save
        redirect_to action: "show" #セーブできたらshowへ
      else
        redirect_to action: "pay" #セーブ出来なきなかったらpayへ
      end
    end
  end

  #PayjpとCardデータベースを削除します
  def delete 
    card = Card.find_by(user_id: "1") #current_user.id
    if card.blank?
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
    end
      redirect_to action: "new" #削除したらnewへ
  end

  #Cardのデータpayjpに送り情報を取り出します
  def show 
    card = Card.find_by(user_id: "1") #current_user.id
    if card.blank?
      redirect_to action: "new" #空ならnewへ
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end


  
end
