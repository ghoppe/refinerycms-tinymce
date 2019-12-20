Refinery::FastController.class_eval do
  def tinymceiframe
    render template: "/refinery/tinymceiframe", layout: false
  end
end
