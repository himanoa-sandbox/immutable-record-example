class ImmutableUser < ApplicationRecord
  def readonly?
    persisted?
  end
end
