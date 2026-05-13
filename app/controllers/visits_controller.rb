class VisitsController < ApplicationController
  helper :arenas
  before_action :set_visit, only: [ :edit, :update ]

  def index
    @visits = Visit.includes(arena: :team).order(created_at: :desc)
  end

  def new
    @arena = Arena.find(params[:arena_id])
    @visit = Visit.new(arena: @arena, status: :want_to_visit)
  end

  def create
    @visit = Visit.new(visit_params)

    if @visit.save
      redirect_to visits_path, notice: "Your arena was saved. You can update details anytime from My Arenas."
    else
      @arena = Arena.find(visit_params[:arena_id])
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @arena = @visit.arena
  end

  def update
    if @visit.update(visit_params)
      redirect_to visits_path, notice: "Your arena details were updated."
    else
      @arena = @visit.arena
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_visit
    @visit = Visit.find(params[:id])
  end

  def visit_params
    params.require(:visit).permit(:arena_id, :status, :notes, :concessions, :favorite_spots, :game_date, :score_url, :photo_url)
  end
end
