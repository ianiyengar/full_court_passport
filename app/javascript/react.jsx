import React from "react"
import { createRoot } from "react-dom/client"
import HomeHero from "./components/HomeHero"
import TeamPicker from "./components/TeamPicker"

function mountReactComponent(id, Component, props = {}) {
  const element = document.getElementById(id)
  if (!element) return
  const root = createRoot(element)
  root.render(<Component {...props} />)
}

const homeHeroEl = document.getElementById("home-hero")
if (homeHeroEl) {
  const arenas = JSON.parse(homeHeroEl.dataset.arenas || "[]")
  const nearestArenaUrl = homeHeroEl.dataset.nearestArenaUrl
  const chooseTeamUrl = homeHeroEl.dataset.chooseTeamUrl
  mountReactComponent("home-hero", HomeHero, { arenas, nearestArenaUrl, chooseTeamUrl })
}

const teamPickerEl = document.getElementById("team-picker")
if (teamPickerEl) {
  const teams = JSON.parse(teamPickerEl.dataset.teams || "[]")
  const selectTeamUrl = teamPickerEl.dataset.selectTeamUrl
  mountReactComponent("team-picker", TeamPicker, { teams, selectTeamUrl })
}
