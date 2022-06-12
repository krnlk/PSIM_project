class StaticController < ApplicationController
    before_action :require_token, only: [:feed]
    def index
        @some_variable = 123
        @clients = Client.all
    end

    def feed
    
    end
end
