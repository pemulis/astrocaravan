module Api
  module V1
    class ProjectsController < ApplicationController
      doorkeeper_for :create, :update, :destroy 
      respond_to :json

      def index
        respond_with Project.all.order("updated_at DESC")
      end

      def show
        respond_with Project.find(params[:id])
      end

      def create
        respond_with Project.create(project_params)
      end

      def update
        respond_with Project.update(params[:id], project_params)
      end

      def destroy
        respond_with Project.destroy(params[:id])
      end

      private

      def project_params
        params.require(:project).permit(:name, :description, :image_url, :location, :tag_list)
      end
    end
  end
end
