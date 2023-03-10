# @param {String} secret
# @param {String} guess
# @return {String}
def get_hint(secret, guess)
  size = secret.length
  chars_map = {}
  bulls = 0
  cows = 0
  
  i = 0

  while i < size
    s = secret[i]
    g = guess[i]
    if s == g
      bulls += 1
    else
      cows += 1 if chars_map[s].to_i < 0
      chars_map[s] = chars_map[s].to_i + 1
      cows += 1 if chars_map[g].to_i > 0
      chars_map[g] = chars_map[g].to_i - 1
    end

    i += 1
  end

  "#{bulls}A#{cows}B"
end
