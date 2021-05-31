class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :articles       
         
  validates :name, presence: true
  enum gender: { ♂: 0, ♀: 1, other: 2}
  
  scope :search, -> (search_params) do
    return if search_params.blank?

    name_like(search_params[:name])
      .gender_is(search_params[:gender])
  end
  scope :name_like, -> (name) { where('name LIKE ?', "%#{name}%") if name.present? }
  scope :gender_is, -> (gender) { where(gender: gender) if gender.present? }
end
