class Company < ApplicationRecord
  has_rich_text :description
  validate :company_email_if_present
  before_save :update_city_and_state, if: :zip_code_changed?

  def update_city_and_state
    if zip_code.present?
      zip_code_details = ZipCodes.identify(zip_code)
      self.city = zip_code_details[:city]
      self.state = zip_code_details[:state_code]
    else
      self.city = ""
      self.city = ""
    end
  end

  def company_email_if_present
    if email.present?
      details = email.split('@')
      if !(details.size ==2 && details.last == "getmainstreet.com")
        errors.add(:email, "Is invalid or using non getmainstreet.com email address")
      end
    end
  end

end
