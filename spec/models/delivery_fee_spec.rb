require 'rails_helper'

RSpec.describe DeliveryFee, type: :model do
  describe 'associations ' do
    it {should belong_to(:order).optional}
  end

  def optional(optional = true)
    remove_submatcher(AssociationMatchers::RequiredMatcher)
    add_submatcher(
      AssociationMatchers::OptionalMatcher,
      name,
      optional,
    )
    self
  end
end
