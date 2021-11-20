class Participants::IndexSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :name, :avatar, :fika_score

  def avatar
    return nil unless object.avatar.attached?

    if Rails.env.test?
      rails_blob_url(object.avatar)
    else
      object.avatar.service_url
    end
  end
end
