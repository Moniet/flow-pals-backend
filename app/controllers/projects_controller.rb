class ProjectsController < ApplicationController
    def create
        project = Project.create(name: project_params[:name], content: project_params[:content])
        collab = Collaborator.create(user_id: current_user.id, project_id: project.id)
    end

    def update
        project = Project.where(id: params[:project][:id])
    end

    def destroy
        project = Project.where(id: params[:project][:id])
    end 

    private 

    def project_params
        params.require(:project).permit(:name, :content)
    end
end

{

}