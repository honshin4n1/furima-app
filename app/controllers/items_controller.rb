class ItemsController < ApplicationController

  def index
    @products = Item.order(created_at: :DESC)
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
