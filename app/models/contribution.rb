class Contribution < ActiveRecord::Base
	validates :score,
	    numericality: { only_interger: true, greater_than_or_equal_to: -100, less_than_or_equal_to: 10000},
         presence: true
    validates :money_received,
      numericality: { only_interger: true, greater_than_or_equal_to: 0,}
      presence: true

end
