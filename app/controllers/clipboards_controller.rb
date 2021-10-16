class ClipboardsController < ApplicationController
    def index

        user = User.where(:id => params[:user_id])
        if user
            render json: Clipboard.where(:user_id => user.id).as_json, status: 404
            return
        end

        render json: {'User not found or installation not verified. We make sure to record and check every installation of our software to prevent spammers and attempt to prevent hackers.'} status: 404
    end

    def create
        if (params.has_key?(:api_key) && params.has_key?(:content))            
            @user = User.where(:uuid => params[:uuid])
            if user
                @user.clipboard.create()   
                render json: Clipboard.where(:user_id => user.id).as_json, status: 404
                return
            end
        end
        render json: {'User not found'} status: 404
    end

    private
    def verify
    def verify_api_key
        if (params.has_key?(:serial_number))
            verified = Install.where(:serial_number => params[:serial_number])
            if (verified)
                return true
            end
        end
        render json: {"User not found or installation not verified. We make sure to record and check every installation of our software to prevent spammers and attempt to prevent hackers."} status: 200
    end
    def verify_installation
        if (params.has_key?(:serial_number))
            verified = Install.where(:serial_number => params[:serial_number])
            if (verified)
                return true
            end
        end
        render json: {"User not found or installation not verified. We make sure to record and check every installation of our software to prevent spammers and attempt to prevent hackers."} status: 200
    end
end
