require 'test_helper'

class UserFeedbackTest < ActiveSupport::TestCase
	def	setup
		@user = users(:agustin)
		@user_feedback = @user.user_feedbacks.build(content: "Lorem ipsum")
	end

	test "should be valid" do
		assert @user_feedback.valid?
	end
		
	test "user ID should be present" do
		@user_feedback.user_id = nil
		assert_not @user_feedback.valid?
	end

	test "content should be present" do
		@user_feedback.content = " "
		assert_not @user_feedback.valid?
	end
		
	test "content should be	at most	500	characters"	do
		@user_feedback.content = "a" * 501
		assert_not @user_feedback.valid?
	end

	test "order should be most recent first" do
		assert_equal UserFeedback.first, user_feedbacks(:one)
	end

end
