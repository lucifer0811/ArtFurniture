require "rails_helper"

RSpec.describe User, type: :model do
	describe "enum roles for user" do
		it {should define_enum_for(:roles)
			.with([:user, :admin])}
	end
end