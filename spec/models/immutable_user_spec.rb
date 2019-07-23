require 'rails_helper'

RSpec.describe ImmutableUser, type: :model do
  describe "#updaete" do
    context 'when not saved record' do
      let(:user) { ImmutableUser.new(name: 'himanoa') }
      it { expect { user.update(name: 'h1manoa').to raise_error ActiveRecord::ReadOnlyRecord} }
    end
    context 'when saved record' do
      let(:user) { ImmutableUser.create(name: 'himanoa') }
      it { expect { user.update(name: 'h1manoa').to raise_error ActiveRecord::ReadOnlyRecord} }
    end
  end
end
