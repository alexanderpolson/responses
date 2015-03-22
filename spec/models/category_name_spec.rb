require 'rails_helper'

describe CategoryName, type: :model do

  describe '.missing' do

    it 'returns a CategoryName' do
      allow(CategoryName).to receive_message_chain(:where, :take).and_return(CategoryName.create)
      expect(described_class.missing).to be_a(CategoryName)
    end
  end
end
