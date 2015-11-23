class Feedback < ActiveRecord::Base
  belongs_to :feedbackable, polymorphic: true
end
