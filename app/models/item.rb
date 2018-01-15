class Item
  attr_reader :data,
              :name,
              :label,
              :description,
              :material,
              :origin,
              :gilt_url,
              :image_urls,
              :inventory_status,
              :units_for_sale,
              :msrp_price,
              :sale_price,
              :color,
              :categories,
              :json_url

  def initialize(data)
    @data             = data
    @name             = data[:name]
    @label            = data[:brand]
    @description      = format_description
    @material         = format_material
    @origin           = format_origin
    @product_url      = data[:url]
    @image_urls       = filter_urls(data[:image_urls][:"420x560"])
    @inventory_status = data[:skus][0][:inventory_status].titleize
    @units_for_sale   = total_units_for_sale(data[:skus])
    @msrp_price       = data[:skus][0][:msrp_price]
    @sale_price       = data[:skus][0][:sale_price]
    @color            = data[:skus][0][:attributes][0][:value].titleize
    @categories       = data[:categories]
    @json_url         = data[:product]
  end

  def on_sale?
    return true if msrp_price != sale_price
  end

  def total_units_for_sale(skus)
    skus.map { |sku| sku[:units_for_sale] }.sum
  end

  def limited_inventory?
    return true if units_for_sale <= 10
  end

  def filter_urls(images_data)
    images_data.map { |data| data[:url] }
  end

  def format_description
    data[:content][:description].gsub("  ", "\n") if data[:content][:description]
  end

  def format_material
    data[:content][:material] if data[:content][:material]
  end

  def format_origin
    data[:content][:origin] if data[:content][:origin]
  end
end