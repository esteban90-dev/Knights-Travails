#Knight's Travails

This is the [Knight's Travails Project](https://www.theodinproject.com/paths/full-stack-ruby-on-rails/courses/ruby-programming/lessons/knights-travails) from The [Odin Project's](https://www.theodinproject.com/) [Ruby Course](https://www.theodinproject.com/paths/full-stack-ruby-on-rails/courses/ruby-programming). 

This app finds the shortest path a knight can take between two positions on a chess board.  

A tree data structure is built by enqueueing all the possible next knight positions from the current position.  Each knight position keeps track of the previous position.  As soon as the queue reaches the destination position, the destination position's references back to the starting position will be the shortest path.  

A live version of the app can be found [here.](https://replit.com/@esteban90/Knights-Travails#main.rb)