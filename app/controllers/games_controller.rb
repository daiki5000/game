class GamesController < ApplicationController
  before_action :require_user_logged_in
  
  def index
    @games = Game.order(id: :desc).page(params[:page]).per(3)
  end
  
  def new
    @game = Game.new
  end
  
  def create
    @game = Game.new(game_params)
    if @game.save
      flash[:success] = '登録しました'
      redirect_to games_path
    else
      flash.now[:danger] = '登録出来ませんでした'
      render :new
    end
  end
  
  def edit
    @game = Game.find(params[:id])
  end
  
  def update
    @game = Game.find(params[:id])
    if @game.update(game_params)
      flash[:success] = 'ゲーム情報が更新されました'
      redirect_to games_path
    else
      flash.now[:danger] = '更新されませんでした'
      render :edit
    end
  end
  
  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    flash[:success] = 'ゲーム情報を削除しました'
    redirect_to games_path
  end
  
  private
  
  def game_params
    params.require(:game).permit(:title, :author, :distributor, :platform, :release, :play, :registration, :renewal)
  end
  
end
