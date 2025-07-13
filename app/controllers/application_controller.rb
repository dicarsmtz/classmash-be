class ApplicationController < ActionController::API
  class_attribute :handle_update_by_http_method, default: false

  before_action :set_model, only: %i[show update destroy]
  before_action :enfore_safe_params!

  public def set_model
    raise ActionController::ParameterMissing, "Missing required param :id" unless params[:id].present?

    @model = query.find_by(id: params[:id])

    raise ActiveRecord::RecordNotFound, "#{model_class} with id=#{params[:id]} not found" unless @model.present?

    @model
  end

  public def enforce_safe_params!
    ActionController::Parameters.action_on_unpermitted_parameters = :raise
  end

  public def effective_action_name
    return action_name.to_sym unless self.class.handle_update_by_http_method && action_name == "update"
    request.put? ? :full_update : :partial_update
  end

  protected def model_class
    raise NotImplementedError, "#{self.class_name} must implement `model_class`"
  end

  protected def query
    raise NotImplementedError, "#{self.class.name} must implement `query`"
  end

  protected def service
    raise NotImplementedError, "#{self.class.name} must implement `servce`"
  end

  protected def serializer
    raise NotImplementedError, "#{self.class.name} must implement `serializer`"
  end

  protected def form
    raise NotImplementedError, "#{self.class.name} must implement `form`"
  end

  protected def safe_params
    raise NotImplementedError, "#{self.class.name} must implement `safe_params`"
  end
end
