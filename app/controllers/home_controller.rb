class HomeController < ApplicationController
  helper :arenas

  def index
    @hero_arenas = Arena.includes(:team).order(:name).limit(6)
    @teams = Team.order(:name)
  end

  def nearest_arena
    @home_city = nearest_arena_params[:city].to_s.strip
    @home_state = nearest_arena_params[:state].to_s.strip
    @home_zip = nearest_arena_params[:zip].to_s.strip
    @nearest_arena = find_nearest_arena(@home_city, @home_state, @home_zip)

    if @nearest_arena.present?
      render :nearest_arena
    else
      flash.now[:alert] = "We couldn't find an arena for that location. Please choose your team from the list."
      @teams = Team.order(:name)
      render :choose_team, status: :unprocessable_entity
    end
  end

  def choose_team
    @teams = Team.order(:name)
  end

  def select_team
    @team = Team.find(params[:team_id])
    @arena = Arena.find_by(team: @team)

    if @arena
      redirect_to new_visit_path(arena_id: @arena.id)
    else
      redirect_to choose_team_path, alert: "That team doesn't have an arena yet. Please pick another team."
    end
  end

  private

  def nearest_arena_params
    params.permit(:city, :state, :zip)
  end

  def find_nearest_arena(city, state, zip)
    if city.present? && state.present?
      Arena.includes(:team).where("city ILIKE ? AND state ILIKE ?", city, state).first
    elsif state.present?
      Arena.includes(:team).where("state ILIKE ?", state).first
    else
      Arena.includes(:team).order(:name).first
    end
  end
end
