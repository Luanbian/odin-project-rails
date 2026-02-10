json.extract! product, :id, :sku, :name, :stock, :stock_status, :created_at, :updated_at
json.url product_url(product, format: :json)
