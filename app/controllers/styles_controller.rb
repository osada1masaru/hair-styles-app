class StylesController < ApplicationController
  before_action :authenticate_user!, only: [:posts, :create, :new, :edit, :update, :destroy]
  before_action :set_own_room, only: [:edit, :update, :destroy]

  def index
    @styles = Style.with_attached_image
  end

  def show
    @style = Style.find(params[:id])
  end

  def new
    @style = Style.new
  end

  def edit
  end

  def create
    @styles = current_user.styles.build(style_params)

    if @styles.save
      redirect_to @styles, notice: "スタイルが登録されました"
    else
      flash.now[:alert] = "スタイルの登録に失敗しました"
      render :new
    end
  end

  def destroy
    if @styles.destroy
      flash[:notice] = "スタイルが削除されました"
    else
      flash[:alert] = "スタイルの削除に失敗しました"
    end
  end

  def own
    @style = current_user.styles.with_attached_image
  end

  private

  def set_own_style
    @style = current_user.styles.find(params[:id])
  end

  def style_params
    params.require(:style).permit(:name, :category, :content, :image)
  end
end
