class Gnoodle < ActiveRecord::Base
  belongs_to :gnoodleportion
  belongs_to :gitem
end
