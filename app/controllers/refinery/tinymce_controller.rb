module Refinery
  class TinymceController < ActionController::Base

    def tinymceiframe
      render :template => "/refinery/tinymceiframe", :layout => false
    end

  end
end
