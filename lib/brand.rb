class Brand < ActiveRecord::Base
    has_many :stocks
    has_many :stores, through: :stocks

    validates(:name, {:presence => true, :length => { :minimum => 0 }})
    validates(:category, {:presence => true, :length => { :minimum => 0 }})
    validates(:gender, {:presence => true, :length => { :minimum => 0 }})

    before_save(:capitalize_properties)

    private

    def capitalize_properties
        self.name=(name().capitalize())
        self.category=(category().capitalize())
        self.gender=(gender().capitalize())
    end
end