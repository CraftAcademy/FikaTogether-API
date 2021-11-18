class Participants::IndexSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :name, :avatar

  def avatar
    return nil unless object.avatar.attached?
    if Rails.env.test?
      rails_blob_url(object.avatar)
    else
      return object.avatar.service_url
    end
  end
end
