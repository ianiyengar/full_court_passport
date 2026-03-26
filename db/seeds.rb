# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# db/seeds.rb

puts "Clearing old data..."
Arena.destroy_all
Team.destroy_all

raw_text = <<~TEXT
Atlanta Hawks: State Farm Arena (Atlanta, GA)
Arena’s First NBA Season: 1999-2000
Capacity: 17,044
About: Located in the heart of downtown Atlanta’s Centennial Park District, State Farm Arena celebrates the city, literally spelling “ATLANTA” in 65-foot letters to welcome fans from all over the southeast United States. As the premier venue for sports and live entertainment in the region, State Farm Arena delivers top-ranked concert tours, professional and collegiate sporting events, family shows and conferences in a world-class setting. (via Hawks)

Boston Celtics: TD Garden (Boston, MA)
Arena’s First NBA Season: 1995-96
Capacity: 18,624
About: As New England’s largest sports and entertainment arena, TD Garden is the home of the storied NBA’s Boston Celtics and NHL’s Boston Bruins franchises and hosts over 3.5 million people a year at its world-renowned concerts, sporting events, family shows, wrestling and ice shows. (via TDGarden.com)

Brooklyn Nets: Barclays Center (Brooklyn, NY)
Arena’s First NBA Season: 2012-13
Capacity: 17,732
About: Barclays Center opened on September 28, 2012, and is a major sports and entertainment venue in the heart of Brooklyn, New York. Barclays Center has one of the most intimate seating configurations ever designed into a modern multi-purpose arena, with unparalleled sightlines and first-class amenities. (via Nets)

Charlotte Hornets: Spectrum Center (Charlotte, NC)
Arena’s First NBA Season: 2005-06
Capacity: 19,077
About: Spectrum Center hosts approximately 150 events annually, including professional and collegiate sports, major concerts, family shows and conventions. Designed to represent Charlotte’s diverse urban culture, as well as the city’s strength and stability, Spectrum Center incorporates contemporary design elements that focus on creating an exciting future for the Queen City’s residents. (via Hornets)

Chicago Bulls: United Center (Chicago, IL)
Arena’s First NBA Season: 1994-95
Capacity: 20,917
About: The United Center, home to the Chicago Bulls and Chicago Blackhawks, and the largest arena in North America, traditionally hosts over 200 events each year and has welcomed over 57 million fans since its opening. The arena is the premier Chicago address for major sporting events, arena touring concerts and special events. (via Bulls)

Cleveland Cavaliers: Rocket Mortgage FieldHouse (Cleveland, OH)
Arena’s First NBA Season: 1994-95
Capacity: 19,432
About: The recently transformed Rocket Mortgage FieldHouse is Northeast Ohio’s premier sports and entertainment facility and a major attraction for top-tier concert tours, family shows and signature events, as well as home to the Cleveland Cavaliers, Cleveland Monsters and the annual MAC Men’s and Women’s basketball tournament. Each year, Rocket Mortgage FieldHouse hosts more than 200 diverse ticketed events and 1,400 private events that draw over 2 million patrons to downtown Cleveland. (via Cavaliers)

Dallas Mavericks: American Airlines Center (Dallas, TX)
Arena’s First NBA Season: 2001-02
Capacity: 19,200
About: American Airlines Center is home to the Dallas Mavericks, the Dallas Stars and more than 200 premier entertainment events annually. Consistently named one of the top 10 arenas in the world in both Billboard and Pollstar, American Airlines Center has hosted thousands of sports and entertainment events since opening in July 2001. (via Mavericks)

Denver Nuggets: Ball Arena (Denver, CO)
Arena’s First NBA Season: 1999-2000
Capacity: 19,520
About: Ball Arena — previously known as Pepsi Center — one of the nation’s finest sports and entertainment facilities, represents the best of Colorado and the Rocky Mountain West. With more than 250 events each year, Ball Arena hosts concerts, family shows, and is home to the Denver Nuggets, Colorado Avalanche and Colorado Mammoth. (via BallArena.com)

Detroit Pistons: Little Caesars Arena (Detroit, MI)
Arena’s First NBA Season: 2017-2018
Capacity: 20,332
About: Little Caesars Arena in The District Detroit serves as the home of the Detroit Pistons, Detroit Red Wings and countless other sports, entertainment and community events. Little Caesars Arena also features state-of-the-art technology, fan amenities and active community spaces like the Via, the BELFOR Training Center and the Chevrolet Plaza. (via LittleCaesarsArena.com)

Golden State Warriors: Chase Center (San Francisco, CA)
Arena’s First NBA Season: 2019-2020
Capacity: 18,064
About: Chase Center is an award-winning 18,064-seat sports and entertainment arena in San Francisco’s Mission Bay neighborhood that is home to the seven-time NBA champion Golden State Warriors and hosts a variety of concerts, family shows and special performances. (via Warriors)

Houston Rockets: Toyota Center (Houston, TX)
Arena’s First NBA Season: 2003-04
Capacity: 18,055
About: Located in the heart of downtown Houston, Toyota Center is the premier sports and entertainment venue in the nation’s fourth-largest market. Since opening its doors in 2003, Toyota Center has been home to the Houston Rockets and host to some of the world’s most well-known national and international touring artists, as well as the 2006 & 2013 NBA All-Star Games and the 2008 Latin Grammys. (via Rockets)

Indiana Pacers: Gainbridge Fieldhouse (Indianapolis, IN)
Arena’s First NBA Season: 1999-2000
Capacity: 17,923
About: More than just iconic architecture painted against the skyline of one of America’s fastest-growing cities, Gainbridge Fieldhouse pulses with energy and invites us in to visit with the spirits from all those Where Were You When moments that wrap us up in true Hoosier Hospitality. The state-of-the-art facility has become a premier venue for more than 2 million guests attending 550 live performances, concerts, conventions and games every year. (via Pacers)

LA Clippers: Intuit Dome (Inglewood, CA)
Arena’s First NBA Season: 2024-25
Capacity: 18,000
About: Designed to deliver a better way to enjoy live events and deliver the most intense home court advantage, Intuit Dome will deliver both as the home of the LA Clippers. Built so there isn’t a bad seat in the house, Intuit Dome has the most comfortable seats and leg room in an arena setting, no matter which section you’re in. (via IntuitDome.com)

Los Angeles Lakers: Crypto.com Arena (Los Angeles, CA)
Arena’s First NBA Season: 1999-2000
Capacity: 18,997
About: Crypto.com Arena has undoubtedly developed an unrivaled reputation for excellence having established itself as one of the world’s busiest and most successful venues in the world, and is the home of three professional sports franchises, the NBA’s Los Angeles Lakers, the NHL’s Los Angeles Kings, and the WNBA’s Los Angeles Sparks. (via Lakers)

Memphis Grizzlies: FedExForum (Memphis, TN)
Arena’s First NBA Season: 2004-05
Capacity: 17,794
About: With over 20+ seasons in the heart of the Mid-South, FedExForum has come to be known as one of the premier arenas in the NBA. It is home to the Memphis Grizzlies and the University of Memphis Tigers men’s basketball team and has hosted millions of fans since the $250 million arena opened in September 2004. (via Grizzlies)

Miami Heat: Kaseya Center (Miami, FL)
Arena’s First NBA Season: 2000-01
Capacity: 19,600
About: Located in the center of booming downtown Miami and the Entertainment District, Kaseya Center is the cornerstone of a rapidly developing downtown area. With its wealth of amenities, incredible location, spectacular surroundings and an impressive array of events, Kaseya Center is the number one choice when looking for entertainment and fun in South Florida. (via Heat)

Milwaukee Bucks: Fiserv Forum (Milwaukee, WI)
Arena’s First NBA Season: 2018-19
Capacity: 17,341
About: Fiserv Forum is much more than just the home of the Milwaukee Bucks. Designed to reflect the heritage, history and personality of Milwaukee while actively projecting progress, accessibility and a renewed sense of community, the state-of-the-art, 714,000-square-foot arena is the hub of entertainment in Wisconsin and the engine that drives growth in downtown Milwaukee. (via FiservForum.com)

Minnesota Timberwolves: Target Center (Minneapolis, MN)
Arena’s First NBA Season: 1990-91
Capacity: 18,024
About: Located in the heart of downtown Minneapolis’ vibrant sports and entertainment district, Target Center is the proud home to the Minnesota Timberwolves and four-time WNBA world champion Minnesota Lynx. Over 1 million guests visit the arena every year — making Target Center one of the top arenas in the world. (via TargetCenter.com)

New Orleans Pelicans: Smoothie King Center (New Orleans, LA)
Arena’s First NBA Season: 2002-03
Capacity: 16,867
About: A center stage for all forms of entertainment, the Smoothie King Center is home to the Pelicans and is the setting for some of the music industry’s top performers and acts. The arena (opened October 29, 1999) stands tall in the colorful mix of downtown New Orleans and is connected by two pedestrian ramps to the magnificent Mercedes-Benz Superdome. (via Pelicans)

New York Knicks: Madison Square Garden (New York, NY)
Arena’s First NBA Season: 1967-68
Capacity: 19,812
About: Celebrated athletes, iconic musicians and top performers alike have all walked the hallowed halls of The World’s Most Famous Arena. Home of the New York Knicks, Rangers, professional boxing, college basketball and so much more, the current Garden is the fourth building (third site) to be named Madison Square Garden and officially opened on Feb. 11, 1968, in Manhattan’s West Side, atop Pennsylvania Station. (via Knicks & MSG.com)

Oklahoma City Thunder: Paycom Center (Oklahoma City, OK)
Arena’s First NBA Season: 2005-06 (New Orleans/Oklahoma City Hornets), 2008-09 (Oklahoma City Thunder)
Capacity: 18,203
About: Home to the Oklahoma City Thunder, Paycom Center also plays host to major concerts, family shows, sporting events and the latest in show-stopping entertainment. Located near two major interstates, it sits in the heart of a downtown renaissance, just steps away from hotels, restaurants and entertainment venues in downtown Oklahoma City and Bricktown. (via Thunder)

Orlando Magic: Kia Center (Orlando, FL)
Arena’s First NBA Season: 2010-11
Capacity: 18,846
About: Orlando’s premier downtown sports and entertainment destination — and home of the Magic — was renamed the Kia Center on Dec. 20, 2023. Kia America’s partnership includes new indoor and outdoor signage, the installation of EV charging stations, Kia vehicle displays and the Kia Terrace, a hospitality lounge for the enjoyment of automotive enthusiasts and sports and music fans. (via Magic)

Philadelphia 76ers: Wells Fargo Center (Philadelphia, PA)
Arena’s First NBA Season: 1996-97
Capacity: 20,007
About: Since opening, the Wells Fargo Center has been a staple in Philadelphia’s iconic Sports Complex … The venue attracts the world’s top tours and events in addition to being home for the city’s beloved 76ers, Flyers and Wings. (via TheNewWFC.com)

Phoenix Suns: Footprint Center (Phoenix, AZ)
Arena’s First NBA Season: 1992-93
Capacity: 17,071
About: Located in the heart of downtown Phoenix, Footprint Center is a multi-purpose arena that is the home of the Phoenix Suns, the WNBA’s Phoenix Mercury and Arizona’s premier concerts.

Portland Trail Blazers: Moda Center (Portland, OR)
Arena’s First NBA Season: 1995-96
Capacity: 19,411
About: The Moda Center is a $267 million multi-purpose arena that opened in the fall of 1995 as the Rose Garden, which remains an ongoing community icon in Portland. The arena serves as the home of the NBA’s Portland Trail Blazers and WHL’s Portland Winterhawks. (via RoseQuarter.com)

Sacramento Kings: Golden 1 Center (Sacramento, CA)
Arena’s First NBA Season: 2016-17
Capacity: 17,611
About: Sitting in the heart of downtown Sacramento, Golden 1 Center brings the community together through their favorite interests: sports, music, entertainment, food, beverage and culture. The innovations and achievements of Golden 1 Center regarding technology, sustainability and fan engagement have sparked change in the sports industry and how businesses connect with their communities. (via Kings)

San Antonio Spurs: Frost Bank Center (San Antonio, TX)
Arena’s First NBA Season: 2002-03
Capacity: 18,354
About: The Frost Bank Center opened in November of 2002 and is the premier entertainment venue in South Texas. The facility hosts two anchor tenants: the San Antonio Spurs and the San Antonio Stock Show & Rodeo. Additionally, the venue has attracted a multitude of concerts, family shows and special events and entertained more than 10 million guests through more than thousands of events. (via FrostBankCenter.com)

Toronto Raptors: Scotiabank Arena (Toronto, ON)
Arena’s First NBA Season: 1998-99
Capacity: 19,800
About: Scotiabank Arena is Canada’s premier sports and entertainment venue and home to the NBA’s Toronto Raptors and NHL’s Toronto Maple Leafs. Owned and operated by MLSE, Scotiabank Arena opened its doors in February 1999 as Air Canada Centre (February 1999 to June 2018). The arena was renamed Scotiabank Arena on July 1, 2018, and has been recognized with more than 40 industry awards. (via ScotiabankArena.com)

Utah Jazz: Delta Center (Salt Lake City, UT)
Arena’s First NBA Season: 1991-92
Capacity: 18,306
About: Delta Center is home to the Utah Jazz and serves as the region’s premier sports and entertainment venue in downtown Salt Lake City. It hosts more than 320 days of sports and entertainment events each year — ranging from NBA games to concerts by world-renowned musicians and other acts, welcoming approximately 1.8 million guests annually. (via DeltaCenter.com)

Washington Wizards: Capital One Arena (Washington, D.C.)
Arena’s First NBA Season: 1997-98
Capacity: 20,333
About: Capital One Arena is home to the Washington Wizards, the NHL’s 2018 Stanley Cup Champion Washington Capitals, and the NCAA’s Georgetown Hoyas men’s basketball team. Boasting an average of 220 events per year, Capital One Arena is the heart of a $9.2 billion redevelopment that began 25 years ago when the arena was built and opened on Dec. 2, 1997. (via CapitalOneArena.com)
TEXT

blocks = raw_text.split(/\n{2,}/)

blocks.each do |block|
  lines = block.lines.map(&:strip).reject(&:empty?)

  header = lines[0]
  season_line = lines.find { |line| line.start_with?("Arena’s First NBA Season:") || line.start_with?("Arena's First NBA Season:") }
  capacity_line = lines.find { |line| line.start_with?("Capacity:") }
  about_line = lines.find { |line| line.start_with?("About:") }

  next unless header && season_line && capacity_line

  header_match = header.match(/\A(.+?):\s+(.+?)\s+\((.+?),\s*(.+?)\)\z/)

  unless header_match
    puts "Skipping malformed header: #{header}"
    next
  end

  team_name   = header_match[1].strip
  arena_name  = header_match[2].strip
  city        = header_match[3].strip
  state       = header_match[4].strip
  season      = season_line.sub(/Arena[’']s First NBA Season:\s*/, "").strip
  capacity    = capacity_line.sub("Capacity:", "").strip.delete(",").to_i
  description = about_line&.sub("About:", "")&.strip

  team = Team.find_or_create_by!(name: team_name) do |t|
    t.city = city if t.respond_to?(:city=)
  end

  arena = Arena.find_or_initialize_by(name: arena_name)
  arena.team = team if arena.respond_to?(:team=)
  arena.city = city if arena.respond_to?(:city=)
  arena.state = state if arena.respond_to?(:state=)
  arena.country = (state == "ON" ? "Canada" : "USA") if arena.respond_to?(:country=)
  arena.capacity = capacity if arena.respond_to?(:capacity=)
  arena.first_nba_season = season if arena.respond_to?(:first_nba_season=)
  arena.description = description if arena.respond_to?(:description=)
  arena.save!

  puts "Seeded #{team_name} - #{arena_name}"
end

puts "Done! Seeded #{Team.count} teams and #{Arena.count} arenas."
