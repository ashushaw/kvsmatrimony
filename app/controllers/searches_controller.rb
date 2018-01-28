class SearchesController < ApplicationController

    def new
      @search = Search.new
      
    end

      def index
      @search = Search.all
    end

    def create
      @search = Search.create(search_params)
      redirect_to @search
    end

    def show
      @search = Search.find(params[:id])
    end

    private

      def search_params
        params.require(:search).permit(:keywords, :city, :age_max, :age_min, :sex)
      end
end
