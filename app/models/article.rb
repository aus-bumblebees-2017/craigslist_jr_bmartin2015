require 'securerandom'

class Article < ApplicationRecord
  belongs_to :category
  has_many :article_tags
  has_many :tags, through: :article_tags

  before_create :generate_edit_id

  validates :title, :descriptions, :email, { presence: true}

  def generate_edit_id
    self.edit_id = SecureRandom.hex(6)
  end
end
