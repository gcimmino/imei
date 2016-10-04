require 'rubygems'
require 'test/unit'
require 'active_model'
require 'imei'
require 'ostruct'

class Mobile < OpenStruct
  include ActiveModel::Validations
  validates :imei, :imei => true
end
