class VenueCategoryLabel < ApplicationRecord
  belongs_to :venue_category
  belongs_to :label

  def self.set_venue_category_labels(venue_category, label_ids)
    venue_category.venue_category_labels.delete_all
    label_ids.each { |id| venue_category.labels << Label.find(id) if id != '' }
  end
end