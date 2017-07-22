class Brand
    has_many :stocks
    has_many :stores, through: :stocks
end