require 'rails_helper'

RSpec.describe JsonWebToken do
  let(:payload) { { user_id: 1 } }
  describe '.encode' do
    it 'encodes a payload' do
      token = described_class.encode(payload)

      expect(token).to be_present
    end
  end

  describe '.decode' do
    it 'decodes a token' do
      token = described_class.encode(payload)
      decoded_token = described_class.decode(token)

      expect(decoded_token).to eq payload.with_indifferent_access
    end
  end
end
