require 'rails_helper'

RSpec.describe User, type: :model do

  describe User do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_length_of(:password).is_at_least(6) }

    it { should have_many(:subs) }
    it { should have_many(:comments) }

  end

  describe User do
    it "checks password correctly" do
      a = User.create!(username: 'Saber', password: '123456')

      expect(a.is_password?('1234567')).to eq(false)
    end

    it 'resets session_token' do
      a = User.create!(username: 'Saber', password: '123456')
      b = a.session_token
      a.reset_session_token

      expect(a.session_token).not_to eq(b)
    end

    it 'should be able to find a User' do
      a = User.create!(username: 'Saber', password: '123456')

      expect(User.find_by_credentials('Saber', '123456')).to eq(a)
    end
  end
end
