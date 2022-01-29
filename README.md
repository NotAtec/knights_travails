# [Knights Travails](https://www.theodinproject.com/paths/full-stack-ruby-on-rails/courses/ruby-programming/lessons/knights-travails)
An assignment project part of [The Odin Project](https://www.theodinproject.com/), where a tree of moves had to be created, and a search algorithm had to be implemented.

## The Task
The actual task at hand was at follows:

1) Create a chess board, and a knight; with all possible moves this knight can make from position X in a tree. 
2) Use an algorithm to find the shortest path between the start & end squares
  * Instead of a regular search algorithm, i used the fact that with the way my queue was setup for the creation of this tree, the first time that the destination square was found; it was on the shortest path.
3) With the known shortest path, output the steps needed for this full path.

All this was implemented into a method `#knight_moves` that will output the path & other details when a beginning and end square are given.