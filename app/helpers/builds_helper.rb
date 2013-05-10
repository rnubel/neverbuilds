module BuildsHelper

  def config(character_class)
    YAML.load_file("config/classes/#{character_class}.yml")    
  end

  def at_wills(character_class)

  end

end
