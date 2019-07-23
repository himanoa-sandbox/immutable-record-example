module Immutable
  extend ActiveSupport::Concern
  included do
    include ActiveRecord::Persistence
    def readonly?
      persisted?
    end

    def self.readonly_attributes
      attribute_names
    end
  end
end
