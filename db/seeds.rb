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

tests = Test.create!([{title: 'Test_1', level: 2, categories_id: categories[0].id},
                      {title: 'Test_2', level: 3, categories_id: categories[0].id},
                      {title: 'Test_3', level: 2, categories_id: categories[1].id},
                      {title: 'Test_4', level: 2, categories_id: categories[2].id},
                      {title: 'Test_5', level: 2, categories_id: categories[3].id},
                      {title: 'Test_6', level: 2, categories_id: categories[4].id},
                      {title: 'Test_7', level: 2, categories_id: categories[4].id},
                      {title: 'Test_8', level: 2, categories_id: categories[3].id},
                      {title: 'Test_9', level: 2, categories_id: categories[2].id}])

questions = Question.create!([{body: 'Question_1', tests_id: tests[1].id},
                              {body: 'Question_2', tests_id: tests[2].id},
                              {body: 'Question_3', tests_id: tests[3].id},
                              {body: 'Question_4', tests_id: tests[4].id},
                              {body: 'Question_5', tests_id: tests[0].id},
                              {body: 'Question_6', tests_id: tests[1].id},
                              {body: 'Question_7', tests_id: tests[1].id},
                              {body: 'Question_8', tests_id: tests[1].id},
                              {body: 'Question_9', tests_id: tests[1].id},
                              {body: 'Question_10', tests_id: tests[1].id},
                              {body: 'Question_11', tests_id: tests[1].id},
                              {body: 'Question_12', tests_id: tests[1].id},
                              {body: 'Question_13', tests_id: tests[1].id},
                              {body: 'Question_14', tests_id: tests[1].id},
                              {body: 'Question_15', tests_id: tests[1].id}])

answers = Answer.create!([{body: 'Answer_1',correct: true, questions_id: questions[1].id},
                          {body: 'Answer_2',correct: true, questions_id: questions[0].id},
                          {body: 'Answer_3',correct: false, questions_id: questions[3].id},
                          {body: 'Answer_4',correct: false, questions_id: questions[4].id},
                          {body: 'Answer_5',correct: false, questions_id: questions[3].id},
                          {body: 'Answer_6',correct: false, questions_id: questions[2].id},
                          {body: 'Answer_7',correct: false, questions_id: questions[0].id}])

involved_tests = InvolvedTest.create!([{users_id: users[1].id, tests_id: tests[1].id},
                                       {users_id: users[2].id, tests_id: tests[2].id},
                                       {users_id: users[3].id, tests_id: tests[3].id},
                                       {users_id: users[4].id, tests_id: tests[4].id},
                                       {users_id: users[1].id, tests_id: tests[5].id},
                                       {users_id: users[2].id, tests_id: tests[6].id},
                                       {users_id: users[3].id, tests_id: tests[7].id},
                                       {users_id: users[4].id, tests_id: tests[8].id},
                                       {users_id: users[4].id, tests_id: tests[3].id},
                                       {users_id: users[4].id, tests_id: tests[4].id},
                                       {users_id: users[3].id, tests_id: tests[4].id},
                                       {users_id: users[2].id, tests_id: tests[4].id},
                                       {users_id: users[1].id, tests_id: tests[4].id}])
