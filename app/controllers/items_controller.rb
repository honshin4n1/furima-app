class ItemsController < ApplicationController

  def index
    #売れてない商品だけ@productsに格納する
    @products = Item.where(deal_state: 0).order(created_at: :DESC)
    @images = ItemImage.all
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
