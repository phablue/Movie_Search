class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :favorites, dependent: :destroy
  after_create :update_user_name

  private
  def update_user_name
    self.update(name: params[:name])
  end
end
