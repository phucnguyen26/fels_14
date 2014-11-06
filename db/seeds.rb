def make_users
  User.create!(name: "FinalDevil",
                 email: "anhhung1303@gmail.com",
                 password: "naruto",
                 password_confirmation: "naruto")
    99.times do |n|
      username  = Faker::Name.first_name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(name: username,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
end

def make_relationships
  users = User.all
  user  = users.first
  followed_users = users[2..50]
  followers      = users[3..50]
  followed_users.each { |followed| user.follow!(followed) }
  followers.each      { |follower| follower.follow!(user) }
end

def make_categories
  10.times do |n|
    name = Faker::Lorem.sentence(1)
    Category.create!(name: name)
  end
end

def make_words
  300.times do |n|
    english = Faker::Lorem.word
    category_id = Random.new.rand(1..10)
    Word.create!(english: english, category_id: category_id)
  end
end

def make_lessons
  user_id = 1
  10.times do |n|
    name = Faker::Lorem.sentence(1)
    num_learned = (10)
    category_id = Random.new.rand(1..5)
    lesson = Lesson.create!(user_id: user_id, name: name, num_learned: num_learned, category_id: category_id)
  end
end

def make_word_answers
  words = Word.all
  words.each do |word|
    content = Faker::Lorem.word
    correct = 1
    word.word_answers.create!(content: content, correct: correct)
  end
end

def make_user_words
  user_id = 1
  10.times do |n|
    word_id = Random.new.rand(200)
    answer = Faker::Lorem.word
    lesson_id = Random.new.rand(1..10)
    UserWord.create!(user_id: user_id, word_id: word_id, answer: answer, lesson_id: lesson_id)
  end
end

def make_lesson_words
  lessons = Lesson.limit(3)
  lessons.each do |lesson|
    category = Category.order("RAND()").first
    20.times do |n|
      word = category.words.order("RAND()").first
      lesson.lesson_words.create!(word_id: word.id)
    end
  end
end

make_users
make_relationships
make_categories
make_words
make_lessons
make_word_answers
make_user_words
make_lesson_words

