from datetime import datetime

def portfolio_profit_calculator(prices: dict[str, float], purchases: list[list]):
    # Create a sorted list of datetime.date and current key representations
    prices_keys_s = sorted(
        [(k, datetime.strptime(k, "%Y-%m-%d").date()) for k in prices.keys()],
        key = lambda x: x[1]
    )
    balance = []
    
    # Iterate over purchases
    for purchase in purchases:
        # Convert string to date object to compare with dates in prices
        purchase_d = datetime.strptime(purchase[0], "%Y-%m-%d").date()
        end_price = prices[prices_keys_s[-1][0]]
        start_price = None
        
        # Find a price window for a specific purchase
        for index in range(1, len(prices_keys_s)):
            if purchase_d >= prices_keys_s[index - 1][1] and purchase_d < prices_keys_s[index][1]:
                start_price = prices[prices_keys_s[index - 1][0]]
                break
            
        if start_price:
            balance.append(purchase[1] * (end_price - start_price))
    
    return sum(balance)
        
