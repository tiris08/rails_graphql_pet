# module Mutations
#   class SignOutUser < BaseMutation
#     field :success, Boolean, null: false

#     def resolve()
#       if current_user.nil?
#         raise GraphQL::ExecutionError, 'Invalid user'
#       end

#       TokenExpirationService.new(context[:headers]).call

#       { success: true }
#     end
#   end
# end
