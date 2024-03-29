class FirstAppPost < ApplicationRecord
  has_one_attached :cover_image
  has_rich_text :content
  validates :titl, presence: true
  validates :content, presence: true

  scope :sorted, ->{ order(published_at: :desc, updated_at: :desc)} #{ order(arel_table[:published_at].desc.nulls_last).order(updated_at: :desc)}
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



