# Validates that start date is earlier than end date
class StartDateValidator < ActiveModel::Validator

  def validate(record)
    if record.start_date > record.end_date
      record.errors.add(:start_date, 'must be earlier than end date')
    end
  end
end
