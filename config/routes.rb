Rails.application.routes.draw do
  root 'quiz#menu'
  get 'quiz/index'
  get 'quiz/restart'
  post 'quiz/start'
  post 'quiz/answer'
  get 'quiz/games'
  post 'quiz/games'
  get 'quiz/menu'
  post 'quiz/menu'
  get 'quiz/clear'
  post 'quiz/playgame'
end