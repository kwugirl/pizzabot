require './pizzabot'

bot = PizzaBot.create_from_input(ARGV.first)
puts bot.instructions
