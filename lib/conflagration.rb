require "conflagration/version"

require "active_model"
require "json"
require "virtus"

class Conflagration
  include ActiveModel::Model
  include Virtus.model

  Unset = Class.new(StandardError)

  def self.path new_path=nil
    new_path ? (@path = new_path) : @path
  end

  def self.attribute name, *args
    super name, *args

    define_method "#{name}!" do
      val = public_send(name)
      raise Unset.new "'#{name}' is not sent" unless val.present?
      val
    end
  end

  def self.read
    new JSON.parse File.read path
  end

  def update attrs
    attrs.each { |k,v| send "#{k}=", v }
    File.write self.class.path, JSON.pretty_generate(as_json)
  end
end
