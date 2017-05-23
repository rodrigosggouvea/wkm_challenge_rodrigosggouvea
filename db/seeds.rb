50.times do |i|
  Client.create!(name: "Cliente #{i}", cpf: (13795672727 + i).to_s, email: "client_#{i}@email.com")
end

50.times do |i|
  Product.create(barcode: i, name: "Produto #{i}", value: 2.5)
end
