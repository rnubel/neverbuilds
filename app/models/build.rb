class Build < ActiveRecord::Base
  belongs_to :user
  has_many :comments, :dependent => :destroy

  validates_presence_of :user 
  validates_presence_of :name
  validates_presence_of :category
  validates_presence_of :class
  validates_uniqueness_of :name

  attr_accessible :name, :body, :category, :user, :video, :class, :type

  opinio_subjectum

  def is_featured?
    true if self.type == "featured"
  end

  def add_activity
    Activity.add(self.user, Activity::POSTED_GUIDE, self)
  end  

  def all_comments
    self.comments.collect { |c| [c] + c.comments }.flatten
  end

  def more_from_category
    Build.find_all_by_category(self.category, :limit => 4, :conditions => ["id != ?", self.id])
  end

  def self.all_categories
    Build.select(:category).group(:category).collect { |g| g.category }
  end
end
