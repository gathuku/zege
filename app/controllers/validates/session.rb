module Validate
   def Session 
     attr_accessor :name,:email

     def initialize (params={})
       @name=params[:name]
       @email=params[:email]

       ActionController.Parameters.new(params).permit(:name,:email)
     end
   end
end
