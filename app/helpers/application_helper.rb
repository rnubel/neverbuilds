module ApplicationHelper

  def format_date(datetime)
    return datetime.strftime("%m/%d/%Y")
  end

  def truncate(string, length = 10)
    string.size > length ? string[0,length] + "&hellip;" : string
  end 

  def render_markdown(text)
    md = RDiscount.new(text)
    md.to_html
  end

  def bar_width(user)
    builds = Build.all.count
    return (user.to_f / builds.to_f * 100).round(2)
  end

  def underscore(server)
    return server.downcase.strip.gsub(' ', '_').gsub(/[^\w-]/, '')
  end 

  def races
    ["Drow", "Dwarf", "Half Elf", "Human", "Halfling", "Tiefling", "Wood Elf"]
  end

  def classes
    ["Trickster Rogue", "Devoted Cleric", "Guardian Fighter", "Great Weapon Fighter", "Control Wizard"]
  end

  def types
    ["PVP", "PVE"]
  end
end
