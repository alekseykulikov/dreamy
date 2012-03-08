# coding: utf-8

Dream.delete_all

def create_dream(name)
  Dream.create! name: name, created_at: Time.now - Integer(rand()*1000).seconds
end

create_dream 'Learning to play on sax'
create_dream 'Diving with scuba'
create_dream 'Visit Iceland'

puts 'OK!'
