import React, { useEffect, useMemo, useState } from "react"

function getCsrfToken() {
  return document.querySelector("meta[name='csrf-token']")?.getAttribute("content") || ""
}

export default function HomeHero({ arenas, nearestArenaUrl, chooseTeamUrl }) {
  const [activeIndex, setActiveIndex] = useState(0)
  const [city, setCity] = useState("")
  const [stateValue, setStateValue] = useState("")
  const [zip, setZip] = useState("")

  useEffect(() => {
    if (arenas.length === 0) return

    const interval = window.setInterval(() => {
      setActiveIndex((current) => (current + 1) % arenas.length)
    }, 4000)

    return () => window.clearInterval(interval)
  }, [arenas.length])

  const activeArena = arenas[activeIndex] || {}

  const carouselArenas = useMemo(() => {
    // Create an infinite carousel loop by repeating the arenas
    const extended = [...arenas, ...arenas, ...arenas]
    return extended.map((arena, index) => ({
      ...arena,
      carouselIndex: index,
      offset: (index - (activeIndex + arenas.length)) * 250, // pixels offset for smooth scroll
    }))
  }, [arenas, activeIndex])

  return (
    <div className="relative min-h-screen overflow-hidden bg-gradient-to-b from-slate-950 via-slate-900 to-slate-950 text-white">
      {/* Animated gradient background */}
      <div className="absolute inset-0 overflow-hidden pointer-events-none">
        <div className="absolute top-0 -left-1/2 w-full h-96 bg-emerald-500/10 rounded-full blur-3xl animate-pulse" />
        <div className="absolute bottom-0 -right-1/2 w-full h-96 bg-blue-500/5 rounded-full blur-3xl animate-pulse" />
      </div>

      {/* Flowing carousel background */}
      <div className="absolute inset-0 overflow-hidden opacity-20">
        <div className="relative w-full h-full">
          <div
            className="absolute top-0 left-0 right-0 bottom-0 flex items-center gap-4 p-4 whitespace-nowrap"
            style={{
              transform: `translateX(${carouselArenas[0]?.offset || 0}px)`,
              transition: "transform 0.1s linear",
            }}
          >
            {carouselArenas.map((arena) => (
              <div
                key={`${arena.id}-${arena.carouselIndex}`}
                className="flex-shrink-0 w-80 h-72 overflow-hidden rounded-3xl border border-white/10 shadow-2xl"
              >
                <img src={arena.imagePath} alt={arena.name} className="w-full h-full object-cover" />
              </div>
            ))}
          </div>
        </div>
      </div>

      <div className="relative z-10 mx-auto max-w-7xl px-4 py-16 sm:px-6 lg:px-8">
        <div className="grid gap-10 lg:grid-cols-[1.3fr_0.7fr] items-start">
          {/* Hero content */}
          <div className="space-y-8 pt-4">
            <div className="space-y-6">
              <div className="inline-block">
                <span className="px-4 py-2 rounded-full bg-emerald-500/15 border border-emerald-500/30 text-emerald-300 text-xs font-semibold uppercase tracking-widest">
                  Full Court Passport
                </span>
              </div>

              <div>
                <h1 className="text-6xl sm:text-7xl font-black tracking-tight text-white leading-[1.1]">
                  Find your NBA arena journey.
                </h1>
              </div>

              <p className="max-w-2xl text-lg leading-relaxed text-slate-300">
                Start from your home area, discover the nearest arena, pick your team, and begin tracking places you have visited or want to visit.
              </p>
            </div>

            <div className="flex flex-col sm:flex-row gap-4 items-start sm:items-center">
              <button
                type="button"
                onClick={() => document.getElementById("home-search-form")?.scrollIntoView({ behavior: "smooth" })}
                className="group px-8 py-4 rounded-full bg-gradient-to-r from-emerald-500 to-emerald-600 text-slate-950 font-semibold shadow-xl shadow-emerald-500/25 hover:shadow-2xl hover:shadow-emerald-500/40 transition duration-300 hover:scale-105 active:scale-95 whitespace-nowrap"
              >
                Get started
              </button>
              <a
                href={chooseTeamUrl}
                className="px-8 py-4 rounded-full border border-white/20 bg-white/5 backdrop-blur text-white font-semibold hover:border-white/40 hover:bg-white/10 transition duration-300 whitespace-nowrap"
              >
                Existing user
              </a>
            </div>
          </div>

          {/* Form card */}
          <div className="rounded-3xl border border-white/10 bg-slate-900/80 backdrop-blur-xl p-8 shadow-2xl shadow-black/40 h-fit sticky top-20">
            <div className="space-y-6">
              <div>
                <h2 className="text-2xl font-bold text-white">Quick Start</h2>
                <p className="mt-1 text-sm text-slate-400">Find your nearest arena</p>
              </div>

              <form action={nearestArenaUrl} method="post" className="space-y-4">
                <input type="hidden" name="authenticity_token" value={getCsrfToken()} />

                <div>
                  <label htmlFor="city" className="block text-xs font-semibold uppercase tracking-wider text-slate-300 mb-2">
                    City
                  </label>
                  <input
                    id="city"
                    name="city"
                    type="text"
                    placeholder="San Francisco"
                    value={city}
                    onChange={(event) => setCity(event.target.value)}
                    className="w-full px-4 py-3 rounded-xl border border-slate-700 bg-slate-800/50 text-white placeholder:text-slate-500 focus:border-emerald-400 focus:ring-2 focus:ring-emerald-400/30 focus:outline-none transition duration-200"
                  />
                </div>

                <div>
                  <label htmlFor="state" className="block text-xs font-semibold uppercase tracking-wider text-slate-300 mb-2">
                    State
                  </label>
                  <input
                    id="state"
                    name="state"
                    type="text"
                    placeholder="CA"
                    value={stateValue}
                    onChange={(event) => setStateValue(event.target.value)}
                    className="w-full px-4 py-3 rounded-xl border border-slate-700 bg-slate-800/50 text-white placeholder:text-slate-500 focus:border-emerald-400 focus:ring-2 focus:ring-emerald-400/30 focus:outline-none transition duration-200"
                  />
                </div>

                <div>
                  <label htmlFor="zip" className="block text-xs font-semibold uppercase tracking-wider text-slate-300 mb-2">
                    ZIP Code <span className="text-slate-500 font-normal">(optional)</span>
                  </label>
                  <input
                    id="zip"
                    name="zip"
                    type="text"
                    placeholder="94105"
                    value={zip}
                    onChange={(event) => setZip(event.target.value)}
                    className="w-full px-4 py-3 rounded-xl border border-slate-700 bg-slate-800/50 text-white placeholder:text-slate-500 focus:border-emerald-400 focus:ring-2 focus:ring-emerald-400/30 focus:outline-none transition duration-200"
                  />
                </div>

                <button
                  type="submit"
                  className="w-full py-3 px-4 rounded-xl bg-gradient-to-r from-emerald-500 to-emerald-600 text-slate-950 font-semibold shadow-lg shadow-emerald-500/20 hover:shadow-xl hover:shadow-emerald-500/30 transition duration-300 hover:scale-105 active:scale-95 mt-6"
                >
                  Find My Arena
                </button>
              </form>
            </div>
          </div>
        </div>

        {/* Current arena highlight */}
        <div className="mt-16 rounded-3xl border border-white/10 bg-gradient-to-br from-slate-900/80 to-slate-950/80 backdrop-blur-xl p-8 sm:p-10 shadow-2xl shadow-black/40">
          <div className="grid gap-8 md:grid-cols-[1fr_auto]">
            <div className="space-y-6">
              <div className="flex items-center gap-3">
                <div className="h-1 w-8 bg-gradient-to-r from-emerald-500 to-blue-500 rounded-full" />
                <p className="text-xs font-semibold uppercase tracking-widest text-emerald-400">Now showing</p>
              </div>

              <div>
                <h3 className="text-5xl sm:text-6xl font-black text-white leading-tight">{activeArena.name}</h3>
                <p className="mt-3 text-lg text-slate-400">
                  <span className="font-semibold text-white">{activeArena.teamName}</span> • {activeArena.city}, {activeArena.state}
                </p>
              </div>

              <div className="grid grid-cols-2 gap-6 pt-4">
                <div>
                  <p className="text-xs font-semibold uppercase tracking-wider text-slate-400">Capacity</p>
                  <p className="mt-2 text-3xl font-bold text-white">{activeArena.capacity?.toLocaleString()}</p>
                </div>
                <div>
                  <p className="text-xs font-semibold uppercase tracking-wider text-slate-400">First Season</p>
                  <p className="mt-2 text-3xl font-bold text-white">{activeArena.firstNbaSeason}</p>
                </div>
              </div>
            </div>

            {/* Carousel indicators */}
            <div className="flex flex-col items-center justify-center gap-6 md:gap-8">
              <div className="text-center">
                <p className="text-4xl font-bold text-emerald-400">{activeIndex + 1}</p>
                <p className="text-xs text-slate-400 uppercase tracking-wider mt-2">of {arenas.length}</p>
              </div>
              <div className="flex flex-col gap-2">
                {arenas.map((_, index) => (
                  <button
                    key={index}
                    onClick={() => setActiveIndex(index)}
                    className={`h-3 rounded-full transition-all duration-300 ${index === activeIndex ? "bg-emerald-500 w-12" : "bg-slate-600 w-3 hover:bg-slate-500"
                      }`}
                    aria-label={`Go to arena ${index + 1}`}
                  />
                ))}
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  )
}
