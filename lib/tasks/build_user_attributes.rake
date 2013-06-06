namespace :user do
  desc "Rebuild users with auth token, password and schedule"
  task :build_user_attributes => :environment do
    User.transaction do
      User.all.each { |u|
        u.build_schedule
        u.generate_token(:auth_token)
        u.generate_token(:password_digest)
        u.save!
      }
    end
  end
end