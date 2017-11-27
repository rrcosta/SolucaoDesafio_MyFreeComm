require 'csv'
FactoryBot.define do 

  factory :example_input do 
    purchasername "Hommer"
    itemdescription "R$20 Sneakers for R$5"
    itemprice "7.0"
    purchasecount "3"
    merchantaddress "1741 Fake St"
    merchantname "Sneaker Store Emporium"
    #import_file { File.new("#{Rails.root}/spec/factories/example_input.csv") }
  end

  factory :random_example_input , class: ExampleInput do 
    purchasername { Faker::Name.first_name }
    itemdescription "R$20 Sneakers for R$5"
    itemprice "7.0"
    purchasecount "3"
    merchantaddress { Faker::Address.street_address }
    merchantname "Bluey Store Emporium"
  end
end

