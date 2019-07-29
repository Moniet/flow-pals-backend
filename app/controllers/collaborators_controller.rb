class CollaboratorsController < ApplicationController
    def create
        collab = Collaborator.new
        collab.user = User.find(current_user.id)
        collab.project = Project.find(create_collab_params[:project_id].to_i)
        collab.save
    end

    def destroy
        collaborator = Collaborator.find(collab_params[:id])

        if collaborator
            collaborator.destroy
        else
            render json: { error: 'Collaborator Not Deleted' }
        end
    end

    private

    def collab_params
        params.require(:collaborator).permit(:id)
    end

    def create_collab_params
        params.require(:collaborator).permit(:project_id)
    end
end
