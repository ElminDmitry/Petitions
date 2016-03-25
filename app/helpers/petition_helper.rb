module PetitionHelper
  def days_last(start_time)
    end_time = start_time + 30.days
    date_0f_p = end_time - Time.now
    dd = date_0f_p.divmod(60*60*24)
    if dd.first < 0
      'Срок истек'
    else
      dd.first
    end
  end
end