class Application < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :status, optional: true
  belongs_to :timeslot, optional: true
  belongs_to :user, optional: true
  belongs_to :region, optional: true
  belongs_to :refusereason, optional: true
  belongs_to :rejectreason, optional: true

  has_many_attached :agreement_photos
  has_one_attached :loan_agreement
  has_one_attached :asp_agreement
  has_one_attached :third_party_agreement
  has_one_attached :pd_agreement
  has_one_attached :passport_photo
  has_one_attached :registration
  has_one_attached :client_passport
end
