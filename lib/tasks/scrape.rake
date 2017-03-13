namespace :scrape do
  desc 'Scrape steam library for games'
  task :steam => [:environment] do
    response = Faraday.get("http://api.steampowered.com/ISteamApps/GetAppList/v0002/")
    games = JSON.parse(response.body)["applist"]["apps"]
    progress_bar = ProgressBar.new(games.count)
    games.each do |game|
      Game.where(title: game["name"]).first_or_create
      progress_bar.increment
    end
  end
end

class ProgressBar
  def initialize(total)
    @total = total
    @counter = 1
  end

  def increment
    complete = sprintf("%#.2f%", ((@counter.to_f / @total.to_f) * 100))
    print "\r\e[0K#{@counter}/#{@total} (#{complete})"
    @counter += 1
  end
end
