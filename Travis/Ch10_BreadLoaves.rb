class Day
  attr_reader :weather, :weekend, :game, :loaves

  def initialize(weather, weekend, game, loaves)
    @weather = weather
    @weekend = weekend
    @game    = game
    @loaves  = loaves
  end

  def score(today)
    total = weather_distance(today)**2 + weekend_distance(today)**2 + game_distance(today)**2
    Math.sqrt(total)
  end

  private

  def weather_distance(today)
    today.weather - weather
  end

  def weekend_distance(today)
    today.weekend - weekend
  end

  def game_distance(today)
    today.game - game
  end
end

class LoaveEstimater
  attr_reader :today, :neighbors

  def self.estimate(day, history)
    estimate = self.new(day)
    estimate.neighbors = history
    estimate.average
  end

  def initialize(day)
    @today = Day.new(*day)
    @neighbors = []
  end

  def neighbors=(history)
    history.each do |metrics|
      day                  = Day.new(*metrics)
      day_score            = day.score(today)
      neighbors[day_score] = [] if neighbors[day_score].nil?
      neighbors[day_score] << day
    end
    self.neighbors.compact!
  end

  def average
    # collect a sample set of 4 or greater
    sample_set = []
    sample_set += neighbors.shift until sample_set.length > 3
    sample_set.flatten!

    sample_set.reduce(0) { |total, day| total + day.loaves } / sample_set.size
  end
end

today   = [4, 1, 0, 0]
history = [[5, 1, 0, 300],
           [3, 1, 1, 225],
           [1, 1, 0, 75],
           [4, 0, 1, 200],
           [4, 0, 0, 150],
           [2, 0, 0, 50]]
loaves  = LoaveEstimater.estimate(today, history)

puts "Make #{loaves} loaves today"
# Make 218 loaves today
