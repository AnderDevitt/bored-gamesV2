class Game < ApplicationRecord
  belongs_to :user
  has_many :users
  has_one :purchase
  # has_one :user, through: :purchases
  
  
  
  # for adding a picture
  has_one_attached :gamepic

  # conditions some damage, incomplete, good, well looked after, brand new
  # {"some damage" => 1, "incomplete" => 2, "good" => 3, "well looked after" => 4, "brand new" => 5}
  enum condition: {some_damage: 1, incomplete: 2, good: 3, well_looked_after: 4, brand_new: 5}

  # genres sci-fi/fantasy, family, strategy, RPG, worker placement, co-op
  # {"sci-fi/fantasy" => 1, "family" => 2, "strategy" => 3, "RPG" => 4, "worker placement" => 5, "co-op" => 6}
  enum genre: {science_fiction: 1, fantasy: 2, family: 3, strategy: 4, RPG: 5, worker_placement: 6, co_op: 7}
end
