desc "This task is called by the Heroku scheduler add-on"
task :remove_old_values => :environment do
  Record.where("created_at <= ?", 1.month.ago.to_date ).delete_all
end
