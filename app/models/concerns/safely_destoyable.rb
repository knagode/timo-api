module SafelyDestroyable extend ActiveSupport::Concern
  included do
    default_scope where(active: true)
  end

  def safe_destroy!
    raise "Object is already destroyed" unless active
    update_attribute(:active, false)
  end
end
