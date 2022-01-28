# frozen_string_literal: false

require 'pry-byebug'

# logic of sequence controller
class SequenceController
  def initialize
    @current_colour = ''
    @next_colour = ''
  end

  def consecutive_occurrence(class_colours)
    # minimum count is always 1
    colour_hash = {
      red: 1,
      blue: 1,
      green: 1,
      yellow: 1,
      white: 1
    }
    # iterate though the array
    class_colours.each_with_index do |colour, index|
      # checks if index = last element of the array
      next if class_colours.size == index
      # checks if current colour is the same as the next colour
      next unless class_colours[index] == class_colours[index + 1]

      # if the same add 1 to the counter of the hash
      colour = colour.to_sym
      colour_hash[colour] += 1
      # else colour is different and does not add to the hash
    end
    colour_hash
  end

  def longest_sequence(colour_hash)
    # get longest consecutive occurrence from all colours
    max_count = colour_hash.values.max
    # filter only the longest consecutive occurrence (2 or more maybe possible)
    colour_hash = colour_hash.filter do |_key, value|
      value == max_count
    end
    longest_sequence_message(colour_hash)
  end

  private

  def longest_sequence_message(colour_hash)
    # get keys from current hash
    keys = colour_hash.keys
    longest_consecutive_occurrence = colour_hash.values.first
    # checks if more than one key is present
    if keys.size > 1
      keys = keys.to_a.join(', ')
    else
      keys = keys.first.to_s
    end
    "#{keys} has the longest sequence of #{longest_consecutive_occurrence}"
  end
end
