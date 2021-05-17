# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Answer.delete_all
Question.delete_all
Test.delete_all
User.delete_all
Category.delete_all

users = User.create!([{ name: 'Иван Иванов', role: 'user', login: 'ivan1', password: 'ivan1' },
                      { name: 'Софья Иванова', role: 'user', login: 'sonya', password: 'sonya1' },
                      { name: 'Степан Петров', role: 'user', login: 'stepan', password: 'stepan1' }])

categories = Category.create!([{ title: 'Программирование' },
                               { title: 'Дизайн' }])

tests = Test.create!([{ title: 'RoR', level: 0, category_id: categories[0].id, author_id: users[0].id },
                      { title: 'RoR', level: 1, category_id: categories[0].id, author_id: users[1].id },
                      { title: 'C++', level: 0, category_id: categories[0].id, author_id: users[1].id },
                      { title: 'C#', level: 0, category_id: categories[0].id, author_id: users[2].id }])

questions = Question.create!([{ text: 'Rails - это ...', test_id: tests[0].id },
                              { text: 'Ruby относится к высокоуровнему языку программирования?', test_id: tests[1].id },
                              { text: 'Rails реализует архитектурный шаблон Model-View-Controller?', test_id: tests[1].id },
                              { text: 'В каком году возник С++?', test_id: tests[2].id },
                              { text: 'В какой компании работали созатели С#?', test_id: tests[3].id }])

answers = Answer.create!([{ title: 'язык программирования', correct: false, question_id: questions[0].id },
                          { title: 'фреймворк', correct: true, question_id: questions[0].id },
                          { title: 'да', correct: true, question_id: questions[1].id },
                          { title: 'нет', correct: false, question_id: questions[1].id },
                          { title: 'да', correct: true, question_id: questions[2].id },
                          { title: 'нет', correct: false, question_id: questions[2].id },
                          { title: '1980', correct: true, question_id: questions[3].id },
                          { title: '1981', correct: false, question_id: questions[3].id },
                          { title: '1990', correct: false, question_id: questions[3].id },
                          { title: 'Google', correct: false, question_id: questions[4].id },
                          { title: 'Microsoft', correct: true, question_id: questions[4].id }])

result = Result.create!([{ user_id: users[0].id, test_id: tests[0].id },
                         { user_id: users[0].id, test_id: tests[1].id },
                         { user_id: users[0].id, test_id: tests[2].id }])
