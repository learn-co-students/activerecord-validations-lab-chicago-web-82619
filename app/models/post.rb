class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction),
    message: "%{value} is not a valid size" }
  validate :is_clickbait?

  HEADLINES = [/Won't Believe/, /Secret/, /Top [0-9]*/, /Guess/]

  def is_clickbait?
    if HEADLINES.none? { |headline| headline.match title }
      errors.add(:title, "must be clickbait")
    end
  end

end
