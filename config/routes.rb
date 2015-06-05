Refinery::Core::Engine.routes.draw do
  get 'tinymceiframe(/:id)', :to => 'fast#tinymceiframe', :as => :tinymceiframe
end
