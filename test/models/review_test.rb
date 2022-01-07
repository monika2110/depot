require "test_helper"

class ReviewTest < ActiveSupport::TestCase

  test "review attributes must not be empty" do
    review = Review.new
    assert review.invalid?
    assert review.errors[:rating].any?
  end


  test "review rating must be 1-5" do
    review = Review.new()
    review.rating = -1
    assert review.invalid?
    assert_equal ["must be greater than or equal to 1"],
                 review.errors[:rating]

    review.rating = 6
    assert review.invalid?
    assert_equal ["must be less than or equal to 5"],
                 review.errors[:rating]

    review.rating = 3
    assert review.valid?
  end



end
