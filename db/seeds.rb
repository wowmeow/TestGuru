Answer.delete_all
Question.delete_all
Test.delete_all
User.delete_all
Category.delete_all

users = User.create!(
  [{ first_name: 'Иван', last_name: 'Иванов', type: 'Admin', password: 'ivan1234', email: 'ivan1@mail.ru' },
   { first_name: 'Софья', last_name: 'Иванова', type: 'Admin', password: 'sonya1', email: 'sonya1@gmail.com' },
   { first_name: 'Степан', last_name: 'Колотушкин', type: 'User', password: 'stepan1', email: 'stepan1@yandex.ru' }]
)

categories = Category.create!([{ title: 'Программирование' },
                               { title: 'Дизайн' }])

tests = Test.create!([{ title: 'RoR', level: 0, category: categories[0], author: users[0] },
                      { title: 'RoR', level: 1, category: categories[0], author: users[1] },
                      { title: 'C++', level: 0, category: categories[0], author: users[1] },
                      { title: 'C#', level: 0, category: categories[0], author: users[2] }])

questions = Question.create!([{ text: 'Rails - это ...', test: tests[0] },
                              { text: 'Ruby относится к высокоуровнему языку программирования?', test: tests[1] },
                              { text: 'Rails реализует архитектурный шаблон Model-View-Controller?', test: tests[1] },
                              { text: 'В каком году возник С++?', test: tests[2] },
                              { text: 'В какой компании работали созатели С#?', test: tests[3] },
                              { text: 'Основным компонентом Rails НЕ является ...', test: tests[0] }])

Answer.create!([{ title: 'язык программирования', correct: false, question: questions[0] },
                { title: 'фреймворк', correct: true, question: questions[0] },
                { title: 'да', correct: true, question: questions[1] },
                { title: 'нет', correct: false, question: questions[1] },
                { title: 'да', correct: true, question: questions[2] },
                { title: 'нет', correct: false, question: questions[2] },
                { title: '1980', correct: true, question: questions[3] },
                { title: '1981', correct: false, question: questions[3] },
                { title: '1990', correct: false, question: questions[3] },
                { title: 'Google', correct: false, question: questions[4] },
                { title: 'Microsoft', correct: true, question: questions[4] },
                { title: 'модель', correct: false, question: questions[5] },
                { title: 'представление', correct: false, question: questions[5] },
                { title: 'браузер', correct: true, question: questions[5] },
                { title: 'контроллер', correct: false, question: questions[5] }])

TestPassage.create!([{ user: users[0], test: tests[0] },
                     { user: users[0], test: tests[1] },
                     { user: users[0], test: tests[3] },
                     { user: users[0], test: tests[3] },
                     { user: users[1], test: tests[0] },
                     { user: users[1], test: tests[3] },
                     { user: users[2], test: tests[1] },
                     { user: users[2], test: tests[2] }])

# Badge.create!([{ name: 'Backend monster', image_name: '.',
#                  receiving_condition: 'Выдать бэйдж после успешного прохождения всех тестов из категории Backend' },
#                { name: 'First test', image_name: '.',
#                  receiving_condition: 'Выдать бэйдж после успешного прохождения теста с первой попытки' }])
