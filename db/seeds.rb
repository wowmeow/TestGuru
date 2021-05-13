# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create!([{ name: 'Иван Иванов', role: 'user', login: 'ivan1', password: 'ivan1' },
                      { name: 'Софья Иванова', role: 'user', login: 'sonya', password: 'sonya1' },
                      { name: 'Степан Петров', role: 'user', login: 'stepan', password: 'stepan1' }])

categories = Category.create!([{ name: 'Программирование' }])

tests = Test.create!([{ title: 'RoR', level: 0, category: categories[0], user: users[0] },
                      { title: 'RoR', level: 1, category: categories[0], user: users[1] },
                      { title: 'C++', level: 0, category: categories[0], user: users[1] },
                      { title: 'C#', level: 0, category: categories[0], user: users[2] }])

questions = Question.create!([{ text: 'Какой-то вопрос для теста по RoR уровня 0', test_id: 1 },
                              { text: 'Какой-то вопрос для теста по RoR уровня 1', test_id: 2 },
                              { text: 'Какой-то текст для теста по RoR уровня 0', test_id: 1 },
                              { text: 'Какой-то текст для теста по С++ уровня 0', test_id: 3 },
                              { text: 'Какой-то текст для теста по С# уровня 0', test_id: 4 }])

answers = Answer.create!([{ title: 'yes', correct: true, question: questions[0] },
                          { title: 'no', correct: false, question: questions[0] },
                          { title: 'yes', correct: true, question: questions[1] },
                          { title: 'no', correct: false , question: questions[1] },
                          { title: 'class', correct: true, question: questions[2] },
                          { title: 'method', correct: false, question: questions[2] },
                          { title: 'yes', correct: false, question: questions[3] },
                          { title: 'no', correct: true, question: questions[3] },
                          { title: '1', correct: true, question: questions[4] },
                          { title: '2', correct: false, question: questions[4] },
                          { title: '3', correct: false, question: questions[4] }])
