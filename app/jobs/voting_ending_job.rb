class VotingEndingJob < ActiveJob::Base
  queue_as :default

  def perform
    petitions = Petition.where(expired: 'false')
    petitions.each do |p|
      if p.expired?(p.id)
        if p.votes.count >= Petition::NEED_VOTES
          UserMailer.sendHundred(p).deliver_later
          UserMailer.send_administartion(p).deliver_later
        else
          UserMailer.not_hundred(p).deliver_later
        end
        p.update_attributes(expired: 'true')
      end
    end
  end
end
