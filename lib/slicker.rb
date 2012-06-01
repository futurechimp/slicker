require 'sanitize'

class Slicker

  def self.protect(params)
    if params.is_a?(String)
      Sanitize.clean(params)
    elsif params.is_a?(Array)
      walk_array(params)
    elsif params.is_a?(Hash)
      walk_hash(params)
    end
  end


  def self.walk_hash(hash)
    hash.keys.each do |key|
      if hash[key].is_a? String
        hash[key] = Sanitize.clean(hash[key])
      elsif hash[key].is_a? Hash
        hash[key] = walk_hash(hash[key])
      elsif hash[key].is_a? Array
        hash[key] = walk_array(hash[key])
      end
    end
    hash
  end

  def self.walk_array(array)
    array.each_with_index do |el,i|
      if el.is_a? String
        array[i] = Sanitize.clean(el)
      elsif el.is_a? Hash
        array[i] = walk_hash(el)
      elsif el.is_a? Array
        array[i] = walk_array(el)
      end
    end
    array
  end

end