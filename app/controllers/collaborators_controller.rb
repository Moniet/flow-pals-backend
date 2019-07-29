class CollaboratorsController < ApplicationController
    def create

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
end
