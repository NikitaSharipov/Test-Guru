# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create!([{name: 'User_1', password: 'pas_1'},
                      {name: 'User_2', password: 'pas_2'},
                      {name: 'User_3', password: 'pas_3'},
                      {name: 'User_4', password: 'pas_4'},
                      {name: 'User_5', password: 'Pas_5'}
                    ])

categories = Category.create!([{title: 'Category_1'},
                               {title: 'Category_2'},
                               {title: 'Category_3'},
                               {title: 'Category_4'},
                               {title: 'Category_5'}])

tests = Test.create!([{title: 'Test_1', level: 2, category_id: categories[0].id, author: users[0]},
                      {title: 'Test_2', level: 3, category_id: categories[0].id, author: users[1]},
                      {title: 'Test_3', level: 2, category_id: categories[1].id, author: users[3]},
                      {title: 'Test_4', level: 2, category_id: categories[2].id, author: users[0]},
                      {title: 'Test_5', level: 2, category_id: categories[3].id, author: users[0]},
                      {title: 'Test_6', level: 2, category_id: categories[4].id, author: users[1]},
                      {title: 'Test_7', level: 2, category_id: categories[4].id, author: users[0]},
                      {title: 'Test_8', level: 2, category_id: categories[3].id, author: users[0]},
                      {title: 'Test_9', level: 2, category_id: categories[2].id, author: users[2]}])

questions = Question.create!([{body: 'Question_1', test_id: tests[1].id},
                              {body: 'Question_2', test_id: tests[2].id},
                              {body: 'Question_3', test_id: tests[3].id},
                              {body: 'Question_4', test_id: tests[4].id},
                              {body: 'Question_5', test_id: tests[0].id},
                              {body: 'Question_6', test_id: tests[1].id},
                              {body: 'Question_7', test_id: tests[1].id},
                              {body: 'Question_8', test_id: tests[1].id},
                              {body: 'Question_9', test_id: tests[1].id},
                              {body: 'Question_10', test_id: tests[1].id},
                              {body: 'Question_11', test_id: tests[1].id},
                              {body: 'Question_12', test_id: tests[1].id},
                              {body: 'Question_13', test_id: tests[1].id},
                              {body: 'Question_14', test_id: tests[1].id},
                              {body: 'Question_15', test_id: tests[1].id}])

answers = Answer.create!([{body: 'Answer_1',correct: true, question_id: questions[1].id},
                          {body: 'Answer_2',correct: true, question_id: questions[0].id},
                          {body: 'Answer_3',correct: false, question_id: questions[3].id},
                          {body: 'Answer_4',correct: false, question_id: questions[4].id},
                          {body: 'Answer_5',correct: false, question_id: questions[3].id},
                          {body: 'Answer_6',correct: false, question_id: questions[2].id},
                          {body: 'Answer_7',correct: false, question_id: questions[0].id}])

involved_tests = InvolvedTest.create!([{user_id: users[1].id, test_id: tests[1].id},
                                       {user_id: users[2].id, test_id: tests[2].id},
                                       {user_id: users[3].id, test_id: tests[3].id},
                                       {user_id: users[4].id, test_id: tests[4].id},
                                       {user_id: users[1].id, test_id: tests[5].id},
                                       {user_id: users[2].id, test_id: tests[6].id},
                                       {user_id: users[3].id, test_id: tests[7].id},
                                       {user_id: users[4].id, test_id: tests[8].id},
                                       {user_id: users[4].id, test_id: tests[3].id},
                                       {user_id: users[4].id, test_id: tests[4].id},
                                       {user_id: users[3].id, test_id: tests[4].id},
                                       {user_id: users[2].id, test_id: tests[4].id},
                                       {user_id: users[1].id, test_id: tests[4].id}])
