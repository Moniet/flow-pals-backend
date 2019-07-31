class ProjectsController < ApplicationController
    def create
        project = Project.create(name: project_params[:name], content: project_params[:content])
        collab = Collaborator.create(user_id: current_user.id, project_id: project.id)

        render json: { project: project }
    end

    def update
        project = Project.find(update_destroy_params[:id])
        collab = project.users.include?(current_user)

        if project && collab
            project.content = update_destroy_params[:content]
            project.name = update_destroy_params[:name]
            project.save
            ActionCable.server.broadcast('project_channel', project)

            render json: project
        else
            render json: { error: 'Project not updated | invalid id' }
        end
    end

    def destroy
        project = Project.find(update_destroy_params[:id])

        if project
            project.destroy
        else
            render json: { error: 'Project not deleted | invalid id' }
        end
    end

    private

    def project_params
        params.require(:project).permit(:name, :content)
    end

    def update_destroy_params
        params.require(:project).permit(:id, :name, :content)
    end
end

{

}
