class Product < ApplicationRecord
  enum :stock_status, { in_stock: 0, low_stock: 1, out_of_stock: 2 }

  before_validation :generate_sku, on: :create
  before_save :calculate_stock_status

  private
    def generate_sku
      self.sku ||= "SKU-#{name.parameterize.downcase}-#{SecureRandom.hex(2)}" if name.present?
    end

    def calculate_stock_status
      self.stock_status = case stock
      when ..0
        :out_of_stock
      when 1..10
        :low_stock
      else
        :in_stock
      end
    end
end
