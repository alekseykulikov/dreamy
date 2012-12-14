Dream.delete_all

def create_dream(name, position)
  Dream.create! name: name, position: position
  puts "#{position}: #{name}"
end

create_dream 'Learn to play on sax', 1
create_dream 'Dive with scuba', 2
create_dream 'Visit Iceland', 3
