# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create!([{name: 'Alex', password: '123456'},
                      {name: 'Stan', password: '2134fd'}])

categories = Category.create!([{title: 'Category_1'},
                               {title: 'Category_2'}])

tests = Test.create!([{title: 'Test_1', level: 2, categories_id: 1},
                      {title: 'Test_2', level: 3, categories_id: 1},
                      {title: 'Test_3', level: 2, categories_id: 2}])

questions = Question.create!([{body: 'Question_1', tests_id: 1},
                              {body: 'Question_2', tests_id: 0}])

answers = Answer.create!([{body: 'Answer_1',correct: true, questions_id: 2},
                          {body: 'Answer_2',correct: true, questions_id: 1},
                          {body: 'Answer_3',correct: false, questions_id: 1])
