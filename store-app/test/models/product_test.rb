require "test_helper"

class ProductTest < ActiveSupport::TestCase
  test "should generate SKU on create" do
    SecureRandom.stubs(:hex).returns("abcd")

    product = create(:product)
    assert product.sku.present?, "SKU should be generated on create"
    assert_equal "SKU-#{product.name.parameterize.downcase}-abcd", product.sku, "SKU should be in the correct format"
  end

  test "should calculate stock status correctly" do
    product = create(:product, stock: 0)
    assert_equal "out_of_stock", product.stock_status, "Stock status should be out_of_stock when stock is 0"

    product.update(stock: 5)
    assert_equal "low_stock", product.stock_status, "Stock status should be low_stock when stock is between 1 and 10"

    product.update(stock: 15)
    assert_equal "in_stock", product.stock_status, "Stock status should be in_stock when stock is greater than 10"
  end
end
