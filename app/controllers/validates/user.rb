module Validate

  class User
    attr_accessor :name, :email, :password

    def initialize(params={})
      @name=params[:name]
      @email=params[:email]
      @password=params[:password]
      ActionController.Parameters.new(params).permit(:name,:email,:password)
    end

  end
end
