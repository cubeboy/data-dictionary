class TermController < ApplicationController
    def index
        terms = []
        if(params[:category])
            begin
            termParam = JSON.parse(params, {symbolize_names: true})
            rescue
            termParam = params
        end
        terms = Term.findByTerms termParam

        termParams = []
        terms.each do |term|
            term.getTerms

            if (term.name.upcase.include? params[:searchVal].upcase) || (term.engName.upcase.include? params[:searchVal].upcase)
                termParams.push(term.clone)
            end
        end

        render json: termParams.to_json
        else

        terms = Term.all
        render json: terms.to_json
        end

    end
   end
