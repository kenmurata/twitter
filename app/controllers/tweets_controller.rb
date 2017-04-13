class TweetsController < ApplicationController
    before_action :set_blog, only: [:edit, :update, :destroy]
    
    def index
        @tweets = Tweet.all
    end
    
    def new
        @tweet = Tweet.new
    end
    
    def create
        @tweet = Tweet.new(tweets_params)
        if @tweet.save
            redirect_to tweets_path, notice: "つぶやきました!"
        else
            render 'new'
        end
    end
    
    def edit
    end
    
    def update
        if @tweet.update(tweets_params)
            redirect_to tweets_path, notice: "編集しました!"
        else
            render 'edit'
        end
    end
    
    def destroy
        @tweet.destroy
        redirect_to tweets_path, notice: "削除完了!"
    end
    
    private
        def tweets_params
            params.require(:tweet).permit(:content)
        end
        
        def set_blog
            @tweet = Tweet.find(params[:id])
        end
end