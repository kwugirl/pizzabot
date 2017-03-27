# PizzaBot

## Solution

For the input `5x5 (0, 0) (1, 3) (4, 4) (4, 2) (4, 2) (0, 1) (3, 2) (2, 3) (4, 1)`,
a correct solution is `DENNNDEEENDSSDDWWWWSDEEENDWNDEESSD`.

## Assumptions made

* The grid is built with a width and height extending towards positive coordinates
from the origin point of (0, 0).
* Locations that are outside the grid are ignored.
* The bot always starts at the origin point, (0, 0).
* Duplicate locations indicate that more than one pizza drop should occur at that
location.
* Minimizing travel time/distance is not important.

## How to run

To use the script:
`ruby run_pizzabot.rb "5x5 (1, 3) (4, 4)"` should return an output of `ENNNDEEEND`.

To run tests:
`ruby pizzabot_test.rb`

## Original problem description

As part of our continuing commitment to the latest cutting-edge pizza technology
research, Slice is working on a robot that delivers pizza. We call it (dramatic
pause): Pizzabot. Your task is to instruct Pizzabot on how to deliver pizzas to
all the houses in a neighborhood.

In more specific terms, given a grid (where each point on the grid is one house)
and a list of points representing houses in need of pizza delivery, return a list
of instructions for getting Pizzabot to those locations and delivering. An
instruction is one of:

N: Move north
S: Move south
E: Move east
W: Move west
D: Drop pizza

Pizzabot always starts at the origin point, (0, 0). As with a mathematical graph,
this point lies at the most south-westerly point of the grid.

Therefore, given the following input:

`$ ./pizzabot 5x5 (1, 3) (4, 4)`

one correct solution would be:

`ENNNDEEEND`

In other words: move east once and north thrice; drop a pizza; move east thrice and
north once; drop a final pizza.

There are multiple correct ways to navigate between locations. We do not take
optimality of route into account when grading: all correct solutions are good
solutions.
