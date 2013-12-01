class JobsMailer < ActionMailer::Base
  default from: "no-reply@hirejuniors.com"

  def confirmation_email(job)
    @job = job
    mail(to: job.author_email, subject: "Please confirm your job listing on HireJuniors")
  end
end
