class LoginController < ApplicationController
  def login
    login_user = User.find_by(name: params[:name], pwd: params[:pwd])
    if login_user != nil
      # プレーンテキストを返却する
      render plain: login_user.token
    else
      render plain: 'ログインに失敗しました'
    end
  end
end
