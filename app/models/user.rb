class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :book, dependent: :destroy
  has_one_attached :profile_image

  def get_profile_image(width,height)
    unless profile_imege.attached?
      file_path = Rails.rooy.join('app/assets_images/no/image.jpeg')
      profile_image.attach(io: File.open(file_path),filename: 'default-image.jpg',content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height].processed)
  end
end
