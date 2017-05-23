# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Client.create(name: 'Rodrigo Gouvea', cpf: '13795672727', email: 'rodrigosggouvea@email.com')
Client.create(name: 'Joao Silva', cpf: '12395672727', email: 'joao@email.com')
Client.create(name: 'Antonio Cardoso', cpf: '123956727212', email: 'antonio@email.com')
Client.create(name: 'Ana Lima', cpf: '123956727222', email: 'ana@email.com')

Product.create(barcode: '123123123123', name: 'Leite Itambe 1L', value: 2.2)
Product.create(barcode: '213564342333', name: 'Leite Molico 1L', value: 4.2)
Product.create(barcode: '553564342333', name: 'Leite Elege 1L', value: 4)
Product.create(barcode: '867867876645', name: 'Pao de forma Bauduco', value: 3.5)
Product.create(barcode: '069489033040', name: 'Pao de forma WickBold', value: 4)
Product.create(barcode: '163325718392', name: 'Requeijao Vigor 250g', value: 5.99)
