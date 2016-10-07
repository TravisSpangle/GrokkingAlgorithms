require 'set'

# Sets
# ============================================
fruits = Set.new %w(avocado tomato banana)
vegetables = Set.new %w(beets, carrot, tomato)
puts "union: #{fruits | vegetables }"
puts "intersect: #{fruits & vegetables }"
puts "difference: #{fruits - vegetables }"

fruits_and_vegetables = fruits & vegetables
puts "Tomato is a fruit & vegatable: #{fruits_and_vegetables.include? "tomato"}"
puts "Avocado is a fruit & vegatable: #{fruits_and_vegetables.include? "avocado"}"

# Output
# ============================================
# union: #<Set:0x007f923b8c5080>
# intersect: #<Set:0x007f923b8c4ec8>
# difference: #<Set:0x007f923b8c4a90>
# Tomato is a fruit & vegatable: true
# Avocado is a fruit & vegatable: false

# Station
# ============================================

class ConfigureStations
  def self.states_by_station
    stations           = {}
    stations["kone"]   = Set.new %w(id nv ut)
    stations["ktwo"]   = Set.new %w(wa id mt)
    stations["kthree"] = Set.new %w(or nv ca)
    stations["kfour"]  = Set.new %w(nv ut)
    stations["kfive"]  = Set.new %w(ca az)

    stations
  end
end

class Stations
  def initialize(stations: ConfigureStations.states_by_station)
    @stations       = stations
    @final_stations = []
  end

  def coverage(states_needed:)
    # Changed from a Set to an Array
    #   Sets are not meant to dispaly data
    final_stations = []

    until states_needed.empty?
      best_station, supported_states = @stations.max_by do |station, states_for_station| 
        (states_needed & states_for_station).length 
      end

      final_stations << best_station
      states_needed -= supported_states
    end

    final_stations.inspect
  end
end

stations = Stations.new
puts stations.coverage(states_needed: %w(mt wa or id nv ut ca az).to_set)

# Output
# ============================================
# ["kone", "ktwo", "kthree", "kfive"]
