class UsersController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def index
        render json: User.all
    end

    def projects
        projects = current_user.projects
        collaborators = projects.map { |p| p.collaborators }
        users = collaborators.map {|hash| hash.map { |c| User.find(c.user_id).username } }

        if projects
            render json: { projects: projects, collaborators: users }
        else
            render json: { error: 'could not render projects'}
        end
    end

    def create
        ActionCable.server.broadcast('project_channel', "new user created")
        user = User.create(user_params)
        if user
            hash = UserSerializer.new(user).serialized_json
            token = encode_token(user_id: user.id)
            render json: { user: hash, jwt: token }, status: :created
        else
            render json: { error: 'failed to create user' }, status: :not_acceptable
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :username, :password)
    end
end
