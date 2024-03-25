require 'rails_helper'

RSpec.describe User, type: :model do
  it "é válido com um email e uma senha" do
    user = User.new(
      email: "user@example.com",
      password: "password"
    )
    expect(user).to be_valid
  end

  it "é inválido sem um email" do
    user = User.new(email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  it "é inválido sem uma senha" do
    user = User.new(password: nil)
    user.valid?
    expect(user.errors[:password]).to include("can't be blank")
  end
end
