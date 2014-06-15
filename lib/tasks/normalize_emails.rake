namespace :db do
  desc "normalizes emails and deletes duplicates"
  task normalize_emails: :environment do
    User.all.each do |user|
      user.email = user.email.downcase.strip
      if !user.save
        user.destroy!
      end
    end
  end

end
