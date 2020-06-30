class ItemsController < ApplicationController

  def index
    #売れてない商品だけ@productsに格納する
    # N＋１問題を解消するためにincludesメソッドを使ってimte_imagesテーブルの情報をインスタンス変数に格納
    @products = Item.where(deal_state: 0).includes(:item_images).order(created_at: :DESC)
  end

  def new
    # レイヤーを変更
    render layout: "nothing"
  end

  def create
    
  end

  def show
    @item = Item.new
  end

  def purchase


    # レイヤーを変更
    render layout: "nothing"
  end

end
