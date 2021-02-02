class UsersController < ApplicationController
    def create
        user=User.create(
            first_name: params[:first_name],
            last_name: params[:last_name],
            email: params[:email],
            password: params[:password]

        )
        render json: user   
    end


    def login
        if (user = User.find_by_email(params[:user][:email])) 
        if !user.blank?
            user.authenticate(params[:user][:password]) 
            render json: {
                status: :created,
                logged_in: true,
                user: user
                }
            else
                render json: {error: 'Invalid Email.'}

            end
        else
            render json: {error: 'Invalid Credentials.'}
        end
    end

    private

    def user_params
        params.require(:user).permit(:email,:password)
    end
end