balance = 223.78
quarters = floor(balance / 0.25) # 895
balance = balance %% 0.25 # 0.03
dimes = floor(balance / 0.1) # 0
balance = balance %% 0.1 # 0.03
nickels = floor(balance / 0.05) # 0
balance = balance %% 0.05 # 0.03
pennies = floor(balance / 0.01) # 3
balance = floor(balance %% 0.01) # 0

list(
  balance = balance,
  quarters = quarters,
  dimes = dimes,
  nickels = nickels,
  pennies = pennies
)

(895 * 0.25) + (3 * 0.01)
