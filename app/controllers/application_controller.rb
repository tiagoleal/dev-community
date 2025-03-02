class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  before_action :authenticate_user!
  # allow_browser versions: :modern

  private

  def render_turbo_stream(action, target, partial = nil, locals = {})
    respond_to do |format|
      format.turbo_stream do
        case action
        when "replace"
          render turbo_stream: turbo_stream.replace(target, partial: partial, locals: locals)
        when "append"
          render turbo_stream: turbo_stream.append(target, partial: partial, locals: locals)
        when "remove"
          render turbo_stream: turbo_stream.remove(target)
        end
      end
    end
  end
end
