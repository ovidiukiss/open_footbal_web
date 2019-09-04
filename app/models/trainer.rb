class Trainer < ApplicationRecord
  belongs_to :team
  validates_presence_of :first_name
  validates_presence_of :last_name
end
