# frozen_string_literal: true

class Counternotice < Notice
  DEFAULT_ENTITY_NOTICE_ROLES = (BASE_ENTITY_NOTICE_ROLES |
                                %w[recipient sender principal submitter]).freeze

  REASONS = %w[owner authorized no_right fair_use removed not_used other].freeze

  validates :title, length: { maximum: 255 }

  def self.model_name
    Notice.model_name
  end

  def self.label
    'Counternotice'
  end

  def to_partial_path
    'notices/notice'
  end
end
