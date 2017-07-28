namespace :db do
	desc "remake database data"
	task remake_data: :environment do

		%w[db:drop db:create db:migrate].each do |task|
			Rake::Task[task].invoke
		end

		User.create email: "admin@framgia.com", password: 12345678, password_confirmation: 12345678,
			address: "Cán Khê, Nguyên Khê, Đông Anh, Hà Nội", birth_day: "08/11/1995", roles: 1, phonenumber: 01632203543,
			name: "Lucifer"

		(1..10).each do
			User.create(
				name: FFaker::Name.name,
				email: FFaker::Internet.email,
				password: 12345678,
				address: FFaker::Address.city,
				birth_day: FFaker::IdentificationESCO.expedition_date,
				phonenumber: FFaker::PhoneNumber.phone_number
			)
		end
	end	
end