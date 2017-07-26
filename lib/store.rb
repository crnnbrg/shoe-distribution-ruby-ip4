class Store < ActiveRecord::Base
  has_many :stocks
  has_many :brands, through: :stocks


  validates(:name, {:presence => true, :length => { :minimum => 0 }})
  validates(:address, {:presence => true, :length => { :minimum => 0 }})
  validates(:telephone, {:presence => true, :length => { :minimum => 0 }})
  validates(:country, {:presence => true, :length => { :minimum => 0 }})

  before_save(:capitalize_properties)

  private

  def capitalize_properties
    self.name=(name().capitalize())
    self.address=(address().capitalize())
    self.country=(country().capitalize())
  end
end
