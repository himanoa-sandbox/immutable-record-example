# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ImmutableUser, type: :model do
  before(:each) do
    ImmutableUser.delete_all
  end

  describe '#updaete' do
    context 'when not saved record' do
      let(:user) { ImmutableUser.new(name: 'himanoa') }
      it { expect { user.update(name: 'h1manoa') } }
    end
    context 'when saved record' do
      let(:user) { ImmutableUser.create(name: 'himanoa') }
      it { expect { user.update(name: 'h1manoa') }.to raise_error ActiveRecord::ReadOnlyRecord }
    end
  end

  describe '#update_columns' do
    let(:user) { ImmutableUser.create(name: 'fooooobar') }
    it { expect { user.update_columns(:name, 'DO NOT UPDATE') }.to raise_error ActiveRecord::ReadOnlyRecord }
  end
end
