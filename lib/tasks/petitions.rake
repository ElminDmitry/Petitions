namespace :petitions do
  desc "chek expired"
  task cheker: :environment do
    VotingEndingJob.perform_later
  end
end
