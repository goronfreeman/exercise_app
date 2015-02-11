user_attr = {
  email: "test@test.com",
  password: "password",
  password_confirmation: "password"
}

user = User.new(user_attr)
user.save!

exercise_attr = {
  name: "test"
}

exercise = user.exercises.build(exercise_attr)
exercise.save!

exercise_session_attr = {
  set_goal: 3,
  rep_goal: 3,
  duration_goal: 1,
  weight: 5
}

exercise_session = exercise.exercise_sessions.new(exercise_session_attr)
exercise_session.save!
