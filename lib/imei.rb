class Imei < ActiveModel::EachValidator
  autoload :ImeiValidator, 'imei/imei_validator'

  def validate_each(record, attribute, value)
    message = options[:message].presence || :invalid
    record.errors.add(attribute, message) unless ImeiValidator.valid?(value)
  end
end
