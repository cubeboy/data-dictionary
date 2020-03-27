class WordController < ApplicationController
    def index
        words = []
        begin
            wordParam = JSON.parse(params[:wordParam], {symbolize_names: true})
        rescue
            wordParam = params[:wordParam]
        end

        if(!wordParam[:search].empty?)
            words = Word.getWords wordParam
        else
            words = Word.all
        end
        render json: words.to_json
    end

    def show
        word = Word.find(params[:id])

        render json: word.to_json
    end

    def create
        begin
            wordParam = JSON.parse(params[:wordParam], {symbolize_names: true})
        rescue
            wordParam = params[:wordParam]
        end

        word = Word.new(wordParam)
        word.save
    end

    def update
        begin
            wordParam = JSON.parse(params[:wordParam], {symbolize_names: true})
        rescue
            wordParam = params[:wordParam]
        end

        word = Word.find(params[:id])
        word.update(wordParam)
    end

    def destroy
        word = Word.find(params[:id])
        word.destroy
    end
end
