require 'sanitize'

class Slicker

  def self.protect(params, config = {})
    if params.is_a?(String)
      Sanitize.clean(params, config)
    elsif params.is_a?(Array)
      walk_array(params, config)
    elsif params.is_a?(Hash)
      walk_hash(params, config)
    end
  end

  def self.walk_hash(hash, config)
    hash.keys.each do |key|
      if hash[key].is_a? String
        hash[key] = Sanitize.clean(hash[key], config)
      elsif hash[key].is_a? Hash
        hash[key] = walk_hash(hash[key], config)
      elsif hash[key].is_a? Array
        hash[key] = walk_array(hash[key], config)
      end
    end
    hash
  end

  def self.walk_array(array, config)
    array.each_with_index do |el,i|
      if el.is_a? String
        array[i] = Sanitize.clean(el, config)
      elsif el.is_a? Hash
        array[i] = walk_hash(el, config)
      elsif el.is_a? Array
        array[i] = walk_array(el, config)
      end
    end
    array
  end

end