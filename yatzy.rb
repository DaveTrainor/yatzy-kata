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
    repeated_number * number_of_repeats
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

    
  def self.smallStraight( d1,  d2,  d3,  d4,  d5)
    tallies = [0]*6
    tallies[d1-1] += 1 #roll a four -> tallies[4-1] = tallies[3] -> count of fours[0, 0, 0, 1, 0, 0]
    tallies[d2-1] += 1 #roll another 4 -> tallies[4-1] = tallies[3] -> count of fours [0, 0, 0, 2, 0, 0]
    tallies[d3-1] += 1
    tallies[d4-1] += 1
    tallies[d5-1] += 1
    (tallies[0] == 1 and
      tallies[1] == 1 and
      tallies[2] == 1 and
      tallies[3] == 1 and
      tallies[4] == 1) ? 15 : 0
  end

  def self.largeStraight( d1,  d2,  d3,  d4,  d5)
    tallies = [0]*6
    tallies[d1-1] += 1
    tallies[d2-1] += 1
    tallies[d3-1] += 1
    tallies[d4-1] += 1
    tallies[d5-1] += 1
    if (tallies[1] == 1 and tallies[2] == 1 and tallies[3] == 1 and tallies[4] == 1 and tallies[5] == 1)
      return 20
    end
    return 0
  end

  def self.fullHouse( d1,  d2,  d3,  d4,  d5)
    tallies = []
    _2 = false
    i = 0
    _2_at = 0
    _3 = false
    _3_at = 0

    tallies = [0]*6
    tallies[d1-1] += 1
    tallies[d2-1] += 1
    tallies[d3-1] += 1
    tallies[d4-1] += 1
    tallies[d5-1] += 1

    for i in Array 0..5
      if (tallies[i] == 2)
        _2 = true
        _2_at = i+1
      end
    end

    for i in Array 0..5
      if (tallies[i] == 3)
        _3 = true
        _3_at = i+1
      end
    end

    if (_2 and _3)
      return _2_at * 2 + _3_at * 3
    else
      return 0
    end
  end
end
