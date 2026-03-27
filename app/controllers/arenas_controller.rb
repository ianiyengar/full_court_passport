class ArenasController < ApplicationController
  def index
    @arenas = Arena.includes(:team).order(:name)
  end

  def show
    @arena = Arena.find(params[:id])
  end
end
