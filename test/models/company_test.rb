require 'test_helper'

class CompanyTest < ActiveSupport::TestCase

  def setup
    @company = companies(:hometown_painting)
  end

  test "should be able to create a company without email" do
    company = Company.new
    assert company.save
  end

  test "should not be able to create company with invalid email" do
    company = Company.new
    company.email = "invalid@email.com"
    assert_not company.save
  end

  test "should be able to create company with valid email" do
    company = Company.new
    company.email = "valid@getmainstreet.com"
    assert company.save
  end

  test "changing zip_code should lead to correct city and state" do
    @company.zip_code = 93009
    assert @company.save
    assert_equal @company.city, "Ventura"
    assert_equal @company.state, "CA"
  end
end
