class ToppagesController < ApplicationController
  def index
    if logged_in?
      # ログインしているのであれば下記を実行
      
      # current_user.microposts.buildは、現在ログインしているUserに紐付いたMicropostの空のデータのインスタンス
      # 空のデータのインスタンスとは→Micropost.new
      # これを現在のUserに紐付けるために、current_user.microposts.buildとしている
      @micropost = current_user.microposts.build #form_for用
      @microposts = current_user.feed_microposts.order('created_at DESC').page(params[:page])
    end
  end
end