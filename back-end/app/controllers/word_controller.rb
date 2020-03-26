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
        word = Word.new(word_params)
        word.save
        # if word.save
        #     redirect_to word
        # else
        #     render 'new'
        # end
    end

    def update
        word = Word.find(params[:id])
        word.update(word_params)
        # if word.update(word_params)
        #     redirect_to word
        # else
        #     render 'edit'
        # end
    end

    def destroy
        word = Word.find(params[:id])
        word.destroy

        # redirect_to word_path
    end

    private
        def word_params
            params.require(:wordParam).permit(:name, :engName, :shortEng, :entity, :column, :javascript, :wordClass, :wordClassMember, :paramValue)
        end


end
