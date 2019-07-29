class UsersController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def profile
        hash = UserSerializer.new(current_user).serialized_json
        render json: {user: hash}, status: :accepted 
    end

    def create
        user = User.create(user_params)
        if user.valid? 
            hash = UserSerializer.new(user).serialized_json
            token = encode_token(user_id: user.id)
            render json: {user: hash, jwt: token}, status: :created
        else 
            render json: {error: 'failed to create user'}, status: :not_acceptable
        end
    end 

    private 

    def user_params
        params.require(:user).permit(:name, :username, :password)
    end
end