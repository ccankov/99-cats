# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

meowster = Cat.create(name: 'Meowster', sex: 'M', color: 'grey',
                      birth_date: 4.years.ago, description: 'Troublemaker.')
purrty = Cat.create(name: 'Purrty', sex: 'F', color: 'golden',
                    birth_date: 2.months.ago, description: 'Lil baby.')
sylvester = Cat.create(name: 'Sylvester', sex: 'M', color: 'black',
                       birth_date: 2.years.ago, description: 'Eats tweeties.')
