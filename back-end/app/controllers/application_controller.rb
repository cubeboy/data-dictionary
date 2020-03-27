class ApplicationController < ActionController::API
    before_action :cors_set_access_control_header

    private
        def cors_set_access_control_header
            headers['Access-Control-Allow-Origin'] = '*'
            headers['Access-Control-Allow-Methods'] = 'POST, PUT, PATCH, DELETE, GET, OPTIONS'
            headers['Access-Control-Request-Method'] = '*'
            headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
        end

    # after_action :set_access_control_headers

    # def set_access_control_headers
    #   headers['Access-Control-Allow-Origin'] = '*'
    #   headers['Access-Control-Request-Method'] = '*'
    # end


end
