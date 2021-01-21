class LablesController < ApplicationController
  before_action :set_lable, only: [:show, :edit, :update, :destroy]
  before_action :current_user

  def index
    @lables = Lable.all
  end

  def show
    @lables = current_user.favorites.find_by(post_id: @lable.id)
  end

  def new
    if params[:back]
      @lable = Lable.new(lable_params)
    else
      @lable = Lable.new
    end
  end

  def confirm
    @lable = Lable.new(lable_params)
    @lable.user_id = current_user.id
  end

  def edit
    @lable = Lable.find(params[:id])
  end

  def create
    @lable = current_user.lable.build(lable_params)
    if params[:back]
      render :new
    else
      @lable.save
      flash[:notice] = 'lable created'
      redirect_to lable_path
    end
  end

  def update
    @lable = Lable.find(params[:id])
    respond_to do |format|
      if @lable.update(lable_params)
        format.html { redirect_to @lable, notice: 'lable was successfully updated.' }
        format.json { render :show, status: :ok, location: @lable }
      else
        format.html { render :edit }
        format.json { render json: @lable.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @lable.destroy
    respond_to do |format|
      format.html { redirect_to lables_url, notice: 'lable was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_lable
     @lable = Lable.find(params[:id])
  end

  def lable_params
     params.require(:lable).permit(:id, :name)
  end
end
