class DdriversController < ApplicationController
  before_action :set_ddriver, only: [:show, :edit, :update, :destroy]

  def index
    @ddrivers = Ddriver.all
  end

  def show
  end

  def new
    @ddriver = Ddriver.new
  end

  def edit
  end

  def create
    @ddriver = Ddriver.new(ddriver_params)

    if @ddriver.save
      redirect_to @ddriver, notice: 'Ddriver was successfully created.'
    else
      render :new
    end
  end

  def update
    if @ddriver.update(ddriver_params)
      redirect_to @ddriver, notice: 'Ddriver was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @ddriver.destroy
    redirect_to ddrivers_url, notice: 'Ddriver was successfully destroyed.'
  end

  def deactive
    @ddriver = Ddriver.find(params[:id])
    @ddriver.deactive!
  end

  private
    def set_ddriver
      @ddriver = Ddriver.find(params[:id])
    end

    def ddriver_params
      params.require(:ddriver).permit(:first_name, :last_name)
    end
end
