module Api
  module V1
    class EventsController < ApplicationController
      respond_to :json

      def index
        respond_with Event.all.order("date DESC")
      end

      def show
        respond_with Event.find(params[:id])
      end

      def create
        respond_with Event.create(event_params)
      end

      def update
        respond_with Event.update(params[:id], event_params)
      end

      def destroy
        respond_with Event.destroy(params[:id])
      end

      private

      def event_params
        params.require(:event).permit(:name, :description, :image_url, :location, :date, :tag_list)
      end

    end
  end
end
