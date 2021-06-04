# oystercard
A Makers Week 2 pair programming challenge.
* **Languages used**: Ruby
* **Testing frameworks**: RSpec
### Functional Representation of User Stories
Objects  | Messages
------------- | -------------
Oystercard | initialize, balance, top_up(value), MAXIMUM_VALUE, deduct(value)
Oystercard | touch_in(station), touch_out(station), in_journey, MINIMUM_VALUE, MINIMUM_CHARGE, 
### Domain Model
```
### Class - Oystercard

Oystercard <-- initialize --> sets balance to 0
Oystercard <-- balance --> amount
Oystercard <-- top_up(amount) --> +balance
Oystercard <-- MAXIMUM_BALANCE = 90 --> balance 
Oystercard <-- deduct(amount) --> balance
Oystercard <-- touch_in(station)/touch_out(station) --> entry_station/exit_station --> stores_journey --> in_journey
Oystercard <-- MINIMUM_BALANCE = 1 --> balance
Oystercard <-- touch_out --> deduct(MINIMUM_CHARGE) --> -balance

### Class - Station

Station <-- initialize --> stores name and zone instance variables

### Class - Journey

Journey <-- initialize -->
