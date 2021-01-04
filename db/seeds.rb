require 'quiz'
require 'question'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Quiz.create(id: 1, name: 'DevSpaces Live Event')
Question.create(quiz_id: 1, order: 1,
      question: 'DevSpaces Filesystem Persistence',
      option_a: 'Option A shown on screen',
      option_b: 'Option B shown on screen',
      option_c: 'Option C shown on screen',
      option_d: 'Option D shown on screen',
      correct_answer: 'B'
)
Question.create(quiz_id: 1, order: 2,
      question: 'DevSpaces Capabilities',
      option_a: 'Option A shown on screen',
      option_b: 'Option B shown on screen',
      option_c: 'Option C shown on screen',
      option_d: 'Option D shown on screen',
      correct_answer: 'D'
)
Question.create(quiz_id: 1, order: 3,
      question: 'Investment graph',
      option_a: 'Option A shown on screen',
      option_b: 'Option B shown on screen',
      option_c: 'Option C shown on screen',
      option_d: 'Option D shown on screen',
      correct_answer: 'B'
)
Question.create(quiz_id: 1, order: 4,
      question: 'Number of paths',
      option_a: 'Option A shown on screen',
      option_b: 'Option B shown on screen',
      option_c: 'Option C shown on screen',
      option_d: 'Option D shown on screen',
      correct_answer: 'C'
)
Question.create(quiz_id: 1, order: 5,
      question: 'Find the mistake',
      option_a: 'Option A shown on screen',
      option_b: 'Option B shown on screen',
      option_c: 'Option C shown on screen',
      option_d: 'Option D shown on screen',
      correct_answer: 'D'
)
Question.create(quiz_id: 1, order: 6,
      question: 'How many Jewels will the observer see?',
      option_a: 'Option A shown on screen',
      option_b: 'Option B shown on screen',
      option_c: 'Option C shown on screen',
      option_d: 'Option D shown on screen',
      correct_answer: 'B'
)
Question.create(quiz_id: 1, order: 7,
      question: 'Blinks per minute',
      option_a: 'Option A shown on screen',
      option_b: 'Option B shown on screen',
      option_c: 'Option C shown on screen',
      option_d: 'Option D shown on screen',
      correct_answer: 'A'
)
Question.create(quiz_id: 1, order: 8,
      question: 'Planet in our solar system',
      option_a: 'Option A shown on screen',
      option_b: 'Option B shown on screen',
      option_c: 'Option C shown on screen',
      option_d: 'Option D shown on screen',
      correct_answer: 'A'
)
Question.create(quiz_id: 1, order: 9,
      question: 'City satellite view',
      option_a: 'Option A shown on screen',
      option_b: 'Option B shown on screen',
      option_c: 'Option C shown on screen',
      option_d: 'Option D shown on screen',
      correct_answer: 'C'
)

