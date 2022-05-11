class Campaign < ApplicationRecord
  #Validations
  validates :name, uniqueness: :true

  #Associations
  has_many :investments, dependent: :destroy

  has_one_attached :image

  validates :image, blob: { content_type: %w(image/jpg image/jpeg image/png image/webp),
                                           size_range: 1..3.megabytes, }, on: :save
  def image_file=(file)
    image.attach(
      io: file[:tempfile],
      filename: file[:filename],
      content_type: file[:type],
      )
  end
end
