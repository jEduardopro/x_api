class Tweet < ApplicationRecord
	include HasUuid

  belongs_to :user
end
