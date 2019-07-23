module Immutable
  extend ActiveSupport::Concern
  included do
    include ActiveRecord::Persistence
    include ActiveRecord::ReadonlyAttributes
    def readonly?
      persisted?
    end

    def self.readonly_attributes
      attribute_names
    end
  end
end
