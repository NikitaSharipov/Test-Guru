class ApplicationMailer < ActionMailer::Base
  default from: %{"TestGuru" <mail@testguru.com>},
          to: 'nikitos120@mail.ru'
  layout 'mailer'
end
