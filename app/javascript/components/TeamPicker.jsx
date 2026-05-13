import React, { useMemo, useState } from "react"

function getCsrfToken() {
  return document.querySelector("meta[name='csrf-token']")?.getAttribute("content") || ""
}

export default function TeamPicker({ teams, selectTeamUrl }) {
  const [query, setQuery] = useState("")

  const filteredTeams = useMemo(() => {
    const normalized = query.trim().toLowerCase()
    if (!normalized) return teams
    return teams.filter((team) =>
      team.name.toLowerCase().includes(normalized) ||
      team.city.toLowerCase().includes(normalized) ||
      team.abbreviation.toLowerCase().includes(normalized)
    )
  }, [query, teams])

  return (
    <div className="min-h-screen bg-slate-950 text-white">
      <div className="mx-auto max-w-6xl px-4 py-16 sm:px-6 lg:px-8">
        <div className="mb-10 flex flex-col gap-4 sm:flex-row sm:items-center sm:justify-between">
          <div>
            <h1 className="text-4xl font-black tracking-tight">Pick your team</h1>
            <p className="mt-2 max-w-2xl text-slate-300">Search your NBA team and hit select to continue.</p>
          </div>
          <a href="/" className="rounded-3xl border border-white/10 bg-white/5 px-5 py-3 text-sm font-semibold text-white transition hover:border-white/20">Back to home</a>
        </div>

        <div className="mb-8 rounded-[2rem] border border-slate-700 bg-slate-900/95 p-6 shadow-2xl shadow-black/20">
          <label htmlFor="team-search" className="block text-sm font-medium text-slate-300">Search teams</label>
          <input
            id="team-search"
            type="text"
            value={query}
            onChange={(event) => setQuery(event.target.value)}
            placeholder="Filter by name, city, or abbreviation"
            className="mt-3 block w-full rounded-3xl border border-slate-700 bg-slate-950 px-4 py-3 text-white placeholder:text-slate-500 focus:border-emerald-400 focus:ring-emerald-400/30"
          />
        </div>

        <div className="grid gap-4 md:grid-cols-2 lg:grid-cols-3">
          {filteredTeams.map((team) => (
            <div key={team.id} className="rounded-[2rem] border border-slate-700 bg-slate-950/95 p-6 shadow-xl shadow-black/20">
              <div className="mb-4">
                <p className="text-sm font-semibold uppercase tracking-[0.2em] text-emerald-400">{team.abbreviation}</p>
                <h2 className="mt-2 text-2xl font-bold text-white">{team.name}</h2>
                <p className="mt-1 text-slate-400">{team.city}</p>
              </div>

              <form action={selectTeamUrl} method="post">
                <input type="hidden" name="authenticity_token" value={getCsrfToken()} />
                <input type="hidden" name="team_id" value={team.id} />
                <button type="submit" className="inline-flex w-full items-center justify-center rounded-3xl bg-emerald-500 px-5 py-3 text-sm font-semibold text-slate-950 transition hover:bg-emerald-400">
                  Select this team
                </button>
              </form>
            </div>
          ))}
        </div>
      </div>
    </div>
  )
}
