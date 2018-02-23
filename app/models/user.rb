class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :trackable, :validatable

  has_many :carts

  belongs_to :current_cart, class_name: "Cart"
  # we want to say that a user instance belongs to something called a current_cart
  # where current_cart is really an instance of Cart class
  # for this to work, we need to have a current_cart_id on the user instance,
  # so we generate migration

  def create_current_cart
    new_cart = self.carts.create # instantiate and save to DB new cart already belonging to user instance
    self.current_cart_id = new_cart.id
    self.save
  end

end
