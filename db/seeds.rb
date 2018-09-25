# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create!([{name: 'User_1', password: 'pas_1', email: 'email_1@email.ru'},
                      {name: 'User_2', password: 'pas_2', email: 'email_2@email.ru'},
                      {name: 'User_3', password: 'pas_3', email: 'email_3@email.ru'},
                      {name: 'User_4', password: 'pas_4', email: 'email_4@email.ru'},
                      {name: 'User_5', password: 'Pas_5', email: 'email_5@email.ru'}
                    ])

categories = Category.create!([{title: 'Category_1'},
                               {title: 'Category_2'},
                               {title: 'Category_3'},
                               {title: 'Category_4'},
                               {title: 'Category_5'}])

tests = Test.create!([{title: 'Test_1', level: 1, category: categories[0], author: users[0]},
                      {title: 'Test_2', level: 3, category: categories[0], author: users[1]},
                      {title: 'Test_3', level: 1, category: categories[1], author: users[3]},
                      {title: 'Test_4', level: 2, category: categories[2], author: users[0]},
                      {title: 'Test_5', level: 2, category: categories[3], author: users[0]},
                      {title: 'Test_6', level: 3, category: categories[4], author: users[1]},
                      {title: 'Test_7', level: 4, category: categories[4], author: users[0]},
                      {title: 'Test_8', level: 5, category: categories[3], author: users[0]},
                      {title: 'Test_9', level: 4, category: categories[2], author: users[2]}])

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

involved_tests = InvolvedTest.create!([{user: users[1], test: tests[1]},
                                       {user: users[2], test: tests[2]},
                                       {user: users[3], test: tests[3]},
                                       {user: users[4], test: tests[4]},
                                       {user: users[1], test: tests[5]},
                                       {user: users[2], test: tests[6]},
                                       {user: users[3], test: tests[7]},
                                       {user: users[4], test: tests[8]},
                                       {user: users[4], test: tests[3]},
                                       {user: users[4], test: tests[4]},
                                       {user: users[3], test: tests[4]},
                                       {user: users[2], test: tests[4]},
                                       {user: users[1], test: tests[4]}])
