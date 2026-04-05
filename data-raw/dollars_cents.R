balance = 223.78
quarter = floor(balance / 0.25)
balance = balance %% 0.25
dime = floor(balance / 0.1)
balance = balance %% 0.1
nickel = floor(balance / 0.05)
balance = balance %% 0.05
penny = floor(balance / 0.01)
balance = floor(balance %% 0.01)

list(
  balance = balance,
  quarter = quarter,
  dime = dime,
  nickel = nickel,
  penny = penny
)

(895 * 0.25) + (3 * 0.01)
