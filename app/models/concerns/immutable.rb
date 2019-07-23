module Immutable
  extend ActiveSupport::Concern
  included do
    include ActiveRecord::Persistence
    def readonly?
      persisted?
    end
  end
end
