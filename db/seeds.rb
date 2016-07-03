# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


monday = Time.new.in_time_zone('Bucharest').beginning_of_week
RunningFilm.create({"time"=>(monday+14.hours).to_i.to_s})
RunningFilm.create({"time"=>(monday+16.hours).to_i.to_s})
RunningFilm.create({"time"=>(monday+18.hours).to_i.to_s})
RunningFilm.create({"time"=>(monday+20.hours).to_i.to_s})

tuesday = monday + 1.day
RunningFilm.create({"time"=>(monday+14.hours).to_i.to_s})
RunningFilm.create({"time"=>(tuesday+16.hours).to_i.to_s})
RunningFilm.create({"time"=>(tuesday+18.hours).to_i.to_s})
RunningFilm.create({"time"=>(tuesday+20.hours).to_i.to_s})

wednesday = tuesday + 1.day
RunningFilm.create({"time"=>(wednesday+14.hours).to_i.to_s})
RunningFilm.create({"time"=>(wednesday+16.hours).to_i.to_s})
RunningFilm.create({"time"=>(wednesday+18.hours).to_i.to_s})
RunningFilm.create({"time"=>(wednesday+20.hours).to_i.to_s})

thursday = wednesday + 1.day
RunningFilm.create({"time"=>(thursday+14.hours).to_i.to_s})
RunningFilm.create({"time"=>(thursday+16.hours).to_i.to_s})
RunningFilm.create({"time"=>(thursday+18.hours).to_i.to_s})
RunningFilm.create({"time"=>(thursday+20.hours).to_i.to_s})

friday = thursday + 1.day
RunningFilm.create({"time"=>(friday+14.hours).to_i.to_s})
RunningFilm.create({"time"=>(friday+16.hours).to_i.to_s})
RunningFilm.create({"time"=>(friday+18.hours).to_i.to_s})
RunningFilm.create({"time"=>(friday+20.hours).to_i.to_s})

saturday = friday + 1.day
RunningFilm.create({"time"=>(saturday+14.hours).to_i.to_s})
RunningFilm.create({"time"=>(saturday+16.hours).to_i.to_s})
RunningFilm.create({"time"=>(saturday+18.hours).to_i.to_s})
RunningFilm.create({"time"=>(saturday+20.hours).to_i.to_s})

sunday = saturday + 1.day
RunningFilm.create({"time"=>(sunday+14.hours).to_i.to_s})
RunningFilm.create({"time"=>(sunday+16.hours).to_i.to_s})
RunningFilm.create({"time"=>(sunday+18.hours).to_i.to_s})
RunningFilm.create({"time"=>(sunday+20.hours).to_i.to_s})

# Next week
monday = monday + 7.days
RunningFilm.create({"time"=>(monday+14.hours).to_i.to_s})
RunningFilm.create({"time"=>(monday+16.hours).to_i.to_s})
RunningFilm.create({"time"=>(monday+18.hours).to_i.to_s})
RunningFilm.create({"time"=>(monday+20.hours).to_i.to_s})

tuesday = monday + 1.day
RunningFilm.create({"time"=>(monday+14.hours).to_i.to_s})
RunningFilm.create({"time"=>(tuesday+16.hours).to_i.to_s})
RunningFilm.create({"time"=>(tuesday+18.hours).to_i.to_s})
RunningFilm.create({"time"=>(tuesday+20.hours).to_i.to_s})

wednesday = tuesday + 1.day
RunningFilm.create({"time"=>(wednesday+14.hours).to_i.to_s})
RunningFilm.create({"time"=>(wednesday+16.hours).to_i.to_s})
RunningFilm.create({"time"=>(wednesday+18.hours).to_i.to_s})
RunningFilm.create({"time"=>(wednesday+20.hours).to_i.to_s})

thursday = wednesday + 1.day
RunningFilm.create({"time"=>(thursday+14.hours).to_i.to_s})
RunningFilm.create({"time"=>(thursday+16.hours).to_i.to_s})
RunningFilm.create({"time"=>(thursday+18.hours).to_i.to_s})
RunningFilm.create({"time"=>(thursday+20.hours).to_i.to_s})

friday = thursday + 1.day
RunningFilm.create({"time"=>(friday+14.hours).to_i.to_s})
RunningFilm.create({"time"=>(friday+16.hours).to_i.to_s})
RunningFilm.create({"time"=>(friday+18.hours).to_i.to_s})
RunningFilm.create({"time"=>(friday+20.hours).to_i.to_s})

# saturday = friday + 1.day
# RunningFilm.create({"time"=>(saturday+14.hours).to_i.to_s})
# RunningFilm.create({"time"=>(saturday+16.hours).to_i.to_s})
# RunningFilm.create({"time"=>(saturday+18.hours).to_i.to_s})
# RunningFilm.create({"time"=>(saturday+20.hours).to_i.to_s})

# sunday = saturday + 1.day
# RunningFilm.create({"time"=>(sunday+14.hours).to_i.to_s})
# RunningFilm.create({"time"=>(sunday+16.hours).to_i.to_s})
# RunningFilm.create({"time"=>(sunday+18.hours).to_i.to_s})
# RunningFilm.create({"time"=>(sunday+20.hours).to_i.to_s})
