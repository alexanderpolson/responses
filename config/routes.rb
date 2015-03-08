Rails.application.routes.draw do
  get 'bomb' => 'responses#bomb'
  get 'random' => 'responses#random'
end
