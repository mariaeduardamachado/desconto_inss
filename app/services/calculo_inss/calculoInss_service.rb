module CalculoInss
  # Description/Explanation of Person class
  class CalculoInssService
    attr_reader :proponent_params, :current_user

    def self.run(proponent_params, current_user = User.find(User::DEFAULT_ID))
      new(proponent_params, current_user).run
    end

    def initialize(proponent_params, current_user)end

    def run
      translation
    end

    private

    def calculador; end
  end
end
