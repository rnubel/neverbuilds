module BuildsHelper

  def class_config(character_class)
    YAML.load_file("config/classes/#{character_class}.yml")    
  end

  def at_wills(character_class)
    conf = class_config(character_class)
    conf["powers"].select{|k,v| v["type"] == "at_will"}.collect{|k,v| k}
  end

end
