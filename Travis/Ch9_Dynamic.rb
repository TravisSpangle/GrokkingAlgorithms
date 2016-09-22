require 'ostruct'
require 'set'
require 'pry'

# 9.2 Camping BackPack
# ================================

class Array
  def score
    self.reduce(0) { |total, item| total+item.score }
  end

  def weight
    self.reduce(0) { |total, item| total+item.weight }
  end
end

class CampingPacker

  POUNDS = 6

  def initialize
    @items = []
    @items << OpenStruct.new(name: 'water'  , weight: 3 , score: 10)
    @items << OpenStruct.new(name: 'food'   , weight: 2 , score: 9)
    @items << OpenStruct.new(name: 'jacket' , weight: 2 , score: 5)
    @items << OpenStruct.new(name: 'book'   , weight: 1 , score: 3)
    @items << OpenStruct.new(name: 'camera' , weight: 1 , score: 6)

    @backpack = Array.new(@items.count)
  end

  def blank_item
    OpenStruct.new(items: '', weight: 0, score: 0)
  end

  def find_best_item(item:, row:, col:)
    pound = col+1

    # if item is too heavy for this column then 
    #   substitute a blank item
    current_item = item.weight <= pound ? item : blank_item

    # retrieve all items curently in this row
    #  and append the current_item
    potential_items = @backpack[row].compact + [current_item]

    # find the item with the highest score
    best_item = potential_items.max_by { |item| item.score }

    # if the best item leaves capacity 
    #   in the backpack then find filler
    if best_item.weight < pound
      capacity = col - best_item.weight

      filler = filler_items(row: row, item:best_item, capacity:capacity) 
      best_item = [best_item, filler].flatten if filler.score > 0 rescue binding.pry
    end
      
    item_above = row > 0 ? @backpack[row-1][col] : blank_item

    best_item.score > item_above.score ? best_item : item_above
  end

  def filler_items(row:, capacity:, item:)
    loop do
      filler = @backpack[row][capacity]

      return blank_item if filler.nil?
      return filler unless already_collected?(filler:filler, item:item)

      capacity -=1
      return blank_item if capacity < 0
    end
  end

  def already_collected?(filler:,item:) 
    filler_names = Array(filler).flatten.map{ |item| item.name }.to_set
    item_names = Array(item).flatten.map{ |item| item.name }.to_set

    !(filler_names & item_names).length.zero?
  end

  def pack
    @items.each_with_index do |item, row|
      @backpack[row] = Array.new(POUNDS)
      POUNDS.times do |col|
        @backpack[row][col] = find_best_item(item:item, row:row, col:col)
      end
    end
  end

  def display
    puts @backpack.last.last
  end
end

camping_packer = CampingPacker.new
camping_packer.pack
camping_packer.display
