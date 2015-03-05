user_attr = {
  email: 'test@test.com',
  password: 'password',
  password_confirmation: 'password'
}

user = User.new(user_attr)
user.save!

exercise_one = user.exercises.build(name: 'test_one')
exercise_one.save!

exercise_two = user.exercises.build(name: 'test_two')
exercise_two.save!

exercise_session_one = exercise_one.exercise_sessions.new(set_goal: 1, rep_goal: 2, duration_goal: 3, weight: 4)
exercise_session_one.save!

exercise_session_two = exercise_one.exercise_sessions.new(set_goal: 2, rep_goal: 3, duration_goal: 4, weight: 5)
exercise_session_two.save!

exercise_session_three = exercise_two.exercise_sessions.new(set_goal: 3, rep_goal: 4, duration_goal: 5, weight: 6)
exercise_session_three.save!

exercise_session_four = exercise_two.exercise_sessions.new(set_goal: 4, rep_goal: 5, duration_goal: 6, weight: 7)
exercise_session_four.save!
