class Picture < ApplicationRecord
  belongs_to :user
  has_attached_file :attachment, default_url: 'missing.png', styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }
  validates_attachment_content_type :attachment, content_type: /\Aimage\/.*\z/
end
