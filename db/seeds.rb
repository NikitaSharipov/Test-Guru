# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.create!([email: "test@test.com", first_name: "test", last_name: "test", password: '123456'])

categories = Category.create!([{title: 'Category_1'},
                               {title: 'Category_2'},
                               {title: 'Category_3'},
                               {title: 'Category_4'},
                               {title: 'Category_5'}])

tests = Test.create!([{title: 'Test_1', level: 1, category: categories[0], author: User.first},
                      {title: 'Test_2', level: 3, category: categories[0], author: User.first},
                      {title: 'Test_3', level: 1, category: categories[1], author: User.first},
                      {title: 'Test_4', level: 2, category: categories[2], author: User.first},
                      {title: 'Test_5', level: 2, category: categories[3], author: User.first},
                      {title: 'Test_6', level: 3, category: categories[4], author: User.first},
                      {title: 'Test_7', level: 4, category: categories[4], author: User.first},
                      {title: 'Test_8', level: 5, category: categories[3], author: User.first},
                      {title: 'Test_9', level: 4, category: categories[2], author: User.first}])

questions = Question.create!([{body: 'Question_1', test: tests[1]},
                              {body: 'Question_2', test: tests[2]},
                              {body: 'Question_3', test: tests[3]},
                              {body: 'Question_4', test: tests[4]},
                              {body: 'Question_5', test: tests[0]},
                              {body: 'Question_6', test: tests[1]},
                              {body: 'Question_7', test: tests[1]},
                              {body: 'Question_8', test: tests[1]},
                              {body: 'Question_9', test: tests[1]},
                              {body: 'Question_10', test: tests[1]},
                              {body: 'Question_11', test: tests[1]},
                              {body: 'Question_12', test: tests[1]},
                              {body: 'Question_13', test: tests[1]},
                              {body: 'Question_14', test: tests[1]},
                              {body: 'Question_15', test: tests[1]}])

answers = Answer.create!([{body: 'Answer_1',correct: true, question: questions[1]},
                          {body: 'Answer_2',correct: true, question: questions[0]},
                          {body: 'Answer_3',correct: false, question: questions[3]},
                          {body: 'Answer_4',correct: false, question: questions[4]},
                          {body: 'Answer_5',correct: false, question: questions[3]},
                          {body: 'Answer_6',correct: false, question: questions[2]},
                          {body: 'Answer_7',correct: false, question: questions[0]}])

test_passages = TestPassage.create!([{user: User.first, test: tests[1]},
                                       {user: User.first, test: tests[2]},
                                       {user: User.first, test: tests[3]},
                                       {user: User.first, test: tests[4]},
                                       {user: User.first, test: tests[5]},
                                       {user: User.first, test: tests[6]},
                                       {user: User.first, test: tests[7]},
                                       {user: User.first, test: tests[8]},
                                       {user: User.first, test: tests[3]},
                                       {user: User.first, test: tests[4]},
                                       {user: User.first, test: tests[4]},
                                       {user: User.first, test: tests[4]},
                                       {user: User.first, test: tests[4]}])
