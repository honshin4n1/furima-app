class ItemsController < ApplicationController

  def index
    #売れてない商品だけ@productsに格納する
    # N＋１問題を解消するためにincludesメソッドを使ってimte_imagesテーブルの情報をインスタンス変数に格納
    @products = Item.where(deal_state: 0).includes(:item_images).order(created_at: :DESC)
  end

  def new
    @category = Category.all
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
    # binding.pry
    @item = Item.new(product_params)
    if @item.save! == true then
      redirect_to root_path
    else
      render :new, layout: "nothing"
    end
  end

  def show
    # item一個に対してはitem_imageのSQLは一つしか走らないのでincludeは不要
    @item = Item.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
    @item = Item.find(params[:id])
    @name = @item.name
    @item.destroy
  end

  private

  def product_params
    params.require(:item).permit(
      :name,
      :price,
      :introduction,
      :size,
      :condition,
      :deal_state,
      :user_id,
      :brand_id,
      :category_id,
      :prefecture_id,
      :preparation_day_id,
      :postage_payer_id,
      item_images_attributes: [:image]
      ).merge(user_id: current_user.id)
  end

  def purchase
    # レイヤーを変更
    render layout: "nothing"
  end

end
