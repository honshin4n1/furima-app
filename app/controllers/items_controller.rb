class ItemsController < ApplicationController
  require 'payjp'

  before_action :set_product, except: [:index, :new, :create]
  before_action :set_url_path, only: [:new, :create, :edit, :update]

  def index
    #売れてない商品だけ@productsに格納する
    # N＋１問題を解消するためにincludesメソッドを使ってimte_imagesテーブルの情報をインスタンス変数に格納
    @products = Item.where(deal_state: 0).includes(:item_images).order(created_at: :DESC)
  end

  def new
    @item = Item.new
    @item.item_images.new
    if user_signed_in? == true then
      #レイアウト変更
      render layout: "nothing"
    else
      redirect_to root_path
    end
  end

  def create
    @item = Item.new(product_params)
    if @item.save == true then
      redirect_to root_path
    else
      render :new, layout: "nothing"
    end
  end

  def show
  end

  def edit
    @item.item_images.build
    @category = Category.all
    #レイアウト変更
    render layout: "nothing"
  end

  def update
    if @item.update_attributes(product_params)
      redirect_to root_path
    else
      render :edit, layout: "nothing"
    end
  end

  def destroy
    @name = @item.name
    @item.destroy
  end

  def get_category_children
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @category_children = Category.find(params[:parent_name]).children
  end

  def purchase
    card = Card.find_by(user_id: current_user.id)
    #テーブルからpayjpの顧客IDを検索
    if card.blank?
      #登録された情報がない場合にカード登録画面に移動
      redirect_to controller: "cards", action: "new"
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      #保管した顧客IDでpayjpから情報取得
      customer = Payjp::Customer.retrieve(card.customer_id)
      #保管したカードIDでpayjpから情報取得、カード情報表示のためインスタンス変数に代入
      @default_card_information = customer.cards.retrieve(card.card_id)

    end

  end

  def pay
    card = Card.find_by(user_id: current_user.id)
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    Payjp::Charge.create(
    :amount => 1100, #@item.price,支払金額を入力（itemテーブル等に紐づけても良い）
    :customer => card.customer_id, #顧客ID
    :currency => 'jpy', #日本円
  )
  redirect_to action: 'done' #完了画面に移動
  end

  def done
  end


  private

  def update_product_params
    params.require(:item).permit(
      :id,
      :name,
      :price,
      :introduction,
      :size,
      :deal_state,
      :brand_id,
      :category_id,
      :prefecture_id,
      :preparation_day_id,
      :postage_payer_id,
      :condition_id,
      item_images_attributes: [:image, :_destroy]
      ).merge(user_id: current_user.id)
  end

  def set_product
    @item = Item.find(params[:id])
  end

  def set_url_path
    @url = request.fullpath
  end
  
end
