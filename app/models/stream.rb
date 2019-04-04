class Stream < ActiveRecord::Base
  has_many :stream_subjects
  belongs_to :board
  has_many :choices
end
