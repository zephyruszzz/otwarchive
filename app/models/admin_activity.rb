class AdminActivity < ActiveRecord::Base
  belongs_to :admin
  belongs_to :target, polymorphic: true

  delegate :login, :to => :admin, :prefix => true

  def self.log_action(admin, target, options={})
    self.create do |activity|
      activity.admin = admin
      activity.target = target
      activity.action = options[:action]
      activity.summary = options[:summary]
    end
  end

  def target_name
    "#{target_type} #{target_id}"
  end
end
