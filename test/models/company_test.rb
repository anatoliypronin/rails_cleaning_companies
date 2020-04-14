require 'test_helper'

class CompanyTest < ActiveSupport::TestCase
  test 'should create company' do
    company = build :company
    company.save

    created_company = Company.last
    assert created_company
  end

  test 'should not create company without email' do
    company = build :company, email: nil || 'wrong email'
    company.save

    created_company = Company.last
    assert_nil created_company
  end

  test 'email should be unique' do
    first_company = build :company, email: 'test@gmail.com'
    first_company.save

    second_company = build :company, email: 'test@gmail.com'
    assert_not second_company.save
  end

  test 'Not enough numbers in phone number' do
    company = build :company, phone_number: '8'
    company.save

    created_company = Company.last
    assert_nil created_company
  end

  test 'should not create company with wrong raiting range' do
    company = build :company, rating: 6
    company.save

    created_company = Company.last
    assert_nil created_company
  end

  test 'should deleted company' do
    company = create :company
    company.del
    assert_equal 'deleted', company.state
  end
end
