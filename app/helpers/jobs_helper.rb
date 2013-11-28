module JobsHelper

  def remote_work(bool)
    if bool
      "The candidate can work remotely."
    else
      "Candidate must be work on site."
    end
  end
end
