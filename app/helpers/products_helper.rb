module ProductsHelper
  def product_option(product)
    "#{product.barcode} - #{product.name} (#{number_to_currency product.value})"
  end
end
