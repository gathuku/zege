require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user=User.new(name:'John Doe',email:'johndoe@gmail.com',password:'password',
                   authentication_token:SecureRandom.alphanumeric, wallet:0.0)
   end

  test 'valid user' do
    assert @user.valid?
  end

  test 'invalid without name' do
    @user.name=nil
    refute @user.valid?, 'saved user without name'
    assert_not_nil @user.errors[:name],'no validation error for name'
  end

  test 'invalid without email' do
    @user.email=nil
    refute @user.valid?, 'saved user without email'
    assert_not_nil @user.errors[:email],'no validation for email'
  end

  test 'invalid without password' do
    @user.password=nil
    refute @user.valid?, 'saved user without password'
    assert_not_nil @user.errors[:password],'no validation for password'
  end


end
