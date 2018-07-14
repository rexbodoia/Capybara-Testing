# == Schema Information
#
# Table name: users
#
#  id              :bigint(8)        not null, primary key
#  username        :string           not null
#  email           :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'
require 'spec_helper'


RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  user = User.new(username: 'harry_potter', email: 'harry_potter@hogwarts.io', password: 'abcdef')
  it {should validate_presence_of(:username)}
  it {should validate_presence_of(:email)}
  it {should validate_length_of(:password).is_at_least(6)}
  it {should validate_presence_of(:password_digest)}
  it {should validate_presence_of(:session_token)}
  it 'should reset session_token' do
    session_token = :session_token
    expect(session_token).to_not equal(user.reset_session_token!)
  end
end
