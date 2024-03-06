class FirstAppPost < ApplicationRecord
  validates :titl, presence: true
  validates :body, presence: true

  scope :sorted, ->{ order(published_at: :desc, updated_at: :desc)}
  scope :draft, -> { where(published_at: nil) }
  scope :published, -> { where("published_at <= ?", Time.current)}
  scope :scheduled, -> { where("published_at > ?", Time.current)}


  def draft?
    published_at.nil?
  end

  def punlished?
    published_at? && published_at <= Time.current
  end

  def scheduled?
    published_at? && published_at > Time.current
  end
end



