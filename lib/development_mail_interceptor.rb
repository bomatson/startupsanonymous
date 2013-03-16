class DevelopmentMailInterceptor
	def self.delivering_email(message)
    message.subject = "#{message.to} #{message.subject}"
    message.to = "bobby.matson@gmail.com"
	end

end