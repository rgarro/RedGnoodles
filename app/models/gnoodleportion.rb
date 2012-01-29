class Gnoodleportion < ActiveRecord::Base
  belongs_to :dish
  belongs_to :gnoodlerecipe
  has_many :gnoodles
end
