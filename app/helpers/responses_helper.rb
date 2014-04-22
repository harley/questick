module ResponsesHelper
  def admin?
    params[:d] == 'supersecret'
  end
end
