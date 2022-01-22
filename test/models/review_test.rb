# frozen_string_literal: true

require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
  test 'review attributes must not be empty' do
    review = Review.new
    assert review.invalid?
    assert review.errors[:rating].any?
    assert review.errors[:product].any?
  end

  test 'review rating must be 1-5' do
    review = Review.new(product: products(:one))
    review.rating = -1
    assert review.invalid?
    assert_equal ['must be greater than or equal to 1'],
                 review.errors[:rating]

    review.rating = 6
    assert review.invalid?
    assert_equal ['must be less than or equal to 5'],
                 review.errors[:rating]

    review.rating = 3
    assert review.valid?
  end

  test 'review comment must be under 1000 characters' do
    review = Review.new(product: products(:one), rating: 5,
                        comment: 'Some of the first things I liked coming from PHP frameworks were the Ruby language
 and the "convention over configuration" paradigm. Once you get that into your mindset and with the help of the Ruby
on Rails guides and scaffolding tools you will have a solid base structure to focus on building the features that
matters. Having tests as a first class citizen also allows you to learn really productive/agile stuffs such as BDD
and red/green refactor cycle. At first it might seem too much rigid about its conventions but after using Rails for
a while you will be able to note that you can apply different conventions and design patterns to achieve different
 purposes, for example use Service Objects to avoid super fat models, render server side Javascript instead of
HTML/ERB, connect to non SQL database or use PostgreSQL jsonb datatypes, background jobs. Whats even better is that
 Rails is incorporating new technologies with each new version. For example, web sockets will be included in Rails
5 via ActionCable and Rails 4 included ActiveJob which was something you have to do "manually" before to have support
for async jobs. And something really important when having code in production is the Rails security reports google
group that is constantly reporting security issues with patches and/or instructions to mitigate vulnerabilities.')
    assert review.invalid?
    assert review.errors[:comment].any?
  end
end
