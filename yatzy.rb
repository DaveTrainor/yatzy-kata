class Yatzy
  def self.chance(dice)
    dice.sum
  end

  def self.yatzy(dice)
    if dice.uniq.count == 1
      return 50
    else
      return 0
    end
  end

  def initialize(d1, d2, d3, d4, d5)
      @dice = [d1, d2, d3, d4, d5]
  end

  def self.specific_number_counter (dice, number_to_count)
    scoring_dice = dice.select {|die| die == number_to_count}
    scoring_dice.size * number_to_count
  end

  def self.ones(dice)
    specific_number_counter(dice, 1)
  end

  def self.twos(dice)
    specific_number_counter(dice, 2)
  end

  def self.threes(dice)
    specific_number_counter(dice, 3)
  end

  def self.fours(dice)
    specific_number_counter(dice, 4)
  end

  def self.fives(dice)
    specific_number_counter(dice, 5)
  end

  def self.sixes(dice)
    specific_number_counter(dice, 6)
  end

  def self.groups_of_numbers(dice, number_of_repeats)
    repeated_number = dice.sort.reverse.detect { |i| dice.count(i) >= number_of_repeats}
    repeated_number != nil ? repeated_number * number_of_repeats : 0
  end

  def self.score_pair(dice)
    groups_of_numbers(dice, 2)
  end

  def self.three_of_a_kind(dice)
    groups_of_numbers(dice, 3)
  end

  def self.four_of_a_kind(dice)
    groups_of_numbers(dice, 4)
  end 

  def self.two_pair(dice)
    low_pair = dice.sort.detect { |i| dice.count(i) >= 2}
    high_pair = dice.sort.reverse.detect { |i| dice.count(i) >= 2}
    high_pair != low_pair ? (high_pair + low_pair) * 2 : 0
  end
    
  def self.smallStraight(dice)
    dice.sort == [1,2,3,4,5] ? 15 : 0
  end

  def self.largeStraight(dice)
    dice.sort == [2,3,4,5,6] ? 20 : 0
  end

  def self.fullHouse(dice)
    pair = groups_of_numbers(dice, 2)
    triple = groups_of_numbers(dice, 3)
    pair > 0 && triple > 0 ? pair + triple : 0
  end
end
