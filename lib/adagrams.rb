# Ga-Young Jin, Raisah Vesteinsdottir Cohort 12
# Monday, August 12th, 2019
# Week 2, Adagram Project

# wave-1

SIZE_OF_HAND = 10

def draw_letters
  letter_dist = {  # given distribution of letters 
    A: 9,
    B: 2,
    C: 2,
    D: 4,
    E: 12,
    F: 2,
    G: 3,
    H: 2,
    I: 9, 
    J: 1,
    K: 1,
    L: 4,
    M: 2,
    N: 6,
    O: 8,
    P: 2,
    Q: 1,
    R: 6,
    S: 4,
    T: 6,
    U: 4,
    V: 2,
    W: 2,
    X: 1,
    Y: 2,
    Z: 1
  }
  
  # putting all available letters into one array
  all_letters = []
  
  letter_dist.each do |letter, quantity|
    quantity.times do
      all_letters << letter.to_s
    end
  end
  
  # create randomized hand
  shuffled_all_letters = all_letters.shuffle 
  hand = []
  
  SIZE_OF_HAND.times do |i|
    hand << shuffled_all_letters[i]
  end
  return hand
end

# wave-2
def uses_available_letters?(input, letters_in_hand)
  input_as_array = input.upcase.split("") 
  hand_in_hash = {}
  
  # determines if string is longer than size of hand
  if input_as_array.length > SIZE_OF_HAND
    return false
  end
  
  # converts letters_in_hand array to hash
  letters_in_hand.each do |char|
    if hand_in_hash.has_key?(char) == true
      hand_in_hash[char] += 1
    else
      hand_in_hash[char] = 1
    end
  end
  
  # determines if letters in string are present in hand
  input_as_array.each do |char|    
    if hand_in_hash.has_key?(char) == true
      hand_in_hash[char] -= 1
    else
      return false
    end
  end
  
  if hand_in_hash.values.min < 0
    return false
  else
    return true
  end
end

