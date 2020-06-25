class ItemsController < ApplicationController

  def index
    
  end
  
  def new

    # レイヤーを変更
    render layout: "users"
  end

  def create

  end


end
