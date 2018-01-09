class UserLabel < ApplicationRecord
  validates_uniqueness_of :user_id, scope: :label_id
  belongs_to :user
  belongs_to :label

  def self.set_favorite_labels(label_ids, user)
    user.labels.delete_all
    label_ids.each { |id| user.labels << Label.find(id) if id != '' }
  end

end