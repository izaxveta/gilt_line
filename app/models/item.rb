class Item
  attr_reader :name,
              :label,
              :description,
              :material,
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
    @name             = data[:name]
    @label            = data[:brand]
    @description      = format_description(data[:content][:description])
    @material         = data[:content][:material]
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

  def total_units_for_sale(skus)
    skus.map { |sku| sku[:units_for_sale] }.sum
  end

  def limited_inventory?
    return true if units_for_sale <= 10
  end

  def filter_urls(images_data)
    images_data.map { |data| data[:url] }
  end

  def format_description(item_description)
    item_description.gsub("  ", "\n")
  end
end