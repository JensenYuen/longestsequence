# frozen_string_literal: false

require_relative './controller/sequence_controller'

AVAL_COLOURS = %w[red blue green yellow white].freeze
collected_colours = []

# This randomly chooses 40 colours from the 5 avaliable colours.
40.times do
  collected_colours << AVAL_COLOURS.sample
end

sequence_controller = SequenceController.new
collected_colours_sorted = sequence_controller.consecutive_occurrence(collected_colours)
puts 'The longest sequence is..'
answer = sequence_controller.longest_sequence(collected_colours_sorted)
puts answer

# test code
# example_one = %w[red red red yellow white blue blue blue green]
# exmaple_two = %w[red red yellow yellow yellow yellow blue red red]

# answer_one_sorted = sequence_controller.consecutive_occurrence(example_one)
# puts 'Example_one's longest sequence is..'
# sequence_controller.longest_sequence(answer_one_sorted)

# answer_two_sorted = sequence_controller.consecutive_occurrence(exmaple_two)
# puts 'Example_two's longest sequence is..'
# sequence_controller.longest_sequence(answer_two_sorted)
