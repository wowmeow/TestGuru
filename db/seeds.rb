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

categories = Category.create!([{ title: 'Программирование' }])

tests = Test.create!([{ title: 'RoR', level: 0, category: categories[0], author: users[0] },
                      { title: 'RoR', level: 1, category: categories[0], author: users[1] },
                      { title: 'C++', level: 0, category: categories[0], author: users[1] },
                      { title: 'C#', level: 0, category: categories[0], author: users[2] }])

questions = Question.create!([{ text: 'Rails - это ...', test_id: 0 },
                              { text: 'Ruby относится к высокоуровнему языку программирования?', test_id: 1 },
                              { text: 'Rails реализует архитектурный шаблон Model-View-Controller?', test_id: 1 },
                              { text: 'В каком году возник С++?', test_id: 2 },
                              { text: 'В какой компании работали созатели С#?', test_id: 3 }])

answers = Answer.create!([{ title: 'язык программирования', correct: false, question: questions[0] },
                          { title: 'фреймворк', correct: true, question: questions[0] },
                          { title: 'да', correct: true, question: questions[1] },
                          { title: 'нет', correct: false, question: questions[1] },
                          { title: 'да', correct: true, question: questions[2] },
                          { title: 'нет', correct: false, question: questions[2] },
                          { title: '1980', correct: true, question: questions[3] },
                          { title: '1981', correct: false, question: questions[3] },
                          { title: '1990', correct: false, question: questions[3] },
                          { title: 'Google', correct: false, question: questions[4] },
                          { title: 'Microsoft', correct: true, question: questions[4] }])
