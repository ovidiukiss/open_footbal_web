class Team < ApplicationRecord
  validates_presence_of :name
  validates_uniqueness_of :name
  before_create :add_abbreviation_from_name!

  has_many :players, dependent: :destroy
  has_one :trainer, dependent: :destroy

  accepts_nested_attributes_for :players
  accepts_nested_attributes_for :trainer

  def add_abbreviation_from_name!
    return if abbreviation

    abbreviation = name.upcase.split(' ')
    self.abbreviation = abbreviation.map(&:first).join('')
  end
end
