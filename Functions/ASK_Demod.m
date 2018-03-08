function [result] = ASK_Demod(input, threshold, bit_frontier)

result = zeros(length(bit_frontier)-2, 1); % << -- last interval is ignored, hence the -2

for b1 = 1 : (length(bit_frontier)-2) % << -- last interval is ignored, so the last relevant interval is between frontier(end-2) and frontier(end-1)

  window = bit_frontier(b1):bit_frontier(b1+1);
  interval = input(window);
  b2 = mean(interval);

  if b2 > threshold(bit_frontier(b1))
    result(b1) = 1;
  end
end