require_relative 'app'

def main
  puts ''
  puts('-----------------------------------')
  puts "\nWelcome to Item Catalog App!!\n\n"
  puts('-----------------------------------')
  puts ''
  app = App.new
  exit = 0
  while exit.zero?
    app.main_menu
    command = gets.chomp.to_i
    if command == 10
      exit = 1
    else
      app.cases(command)
    end
  end
  app.save
  puts ''
  puts 'Thanks for using the app'
  puts ''
end

main
