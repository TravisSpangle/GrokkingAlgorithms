class LoaveEstimater
  Day = Struct.new(:weather, :weekend, :game, :loaves)
  attr_reader :today, :neighbors

  def self.estimate(day, history)
    estimate = self.new(day)
    estimate.neighbors=history
    estimate.average
  end

  def initialize(day)
    @today = Day.new(*day)
    @neighbors = []
  end

  def neighbors=(history)
    history.each do |metrics|
      day                  = Day.new(*metrics)
      day_score            = score(day)
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

  private

  def score(day)
    total = weather(day)**2 + weekend(day)**2 + game(day)**2
    Math.sqrt(total)
  end

  def weather(day)
    today.weather - day.weather
  end

  def weekend(day)
    today.weekend - day.weekend
  end

  def game(day)
    today.game - day.game
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
