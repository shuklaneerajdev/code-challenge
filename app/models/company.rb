class Company < ApplicationRecord
  has_rich_text :description
  validate :company_email_if_present

  def company_email_if_present
    if email.present?
      details = email.split('@')
      if !(details.size ==2 && details.last == "getmainstreet.com")
        errors.add(:email, "Is invalid or using non getmainstreet.com email address")
      end
    end
  end

end
