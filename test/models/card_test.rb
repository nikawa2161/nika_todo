# == Schema Information
#
# Table name: cards
#
#  id         :bigint           not null, primary key
#  content    :text             not null
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  board_id   :bigint           not null
#
# Indexes
#
#  index_cards_on_board_id  (board_id)
#
require 'test_helper'

class CardTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
