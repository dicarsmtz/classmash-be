module CommonActions
  module Base
    protected def query_for(method_action)
      method_name = "#{method}_query"
      respond_to?(method_name, true) ? send(method_name) : query
    end

    protected def service_for(method_action)
      method_name = "#{method}_service"
      respond_to?(method_name, true) ? send(method_name) : query
    end

    protected def serializer_for(method_action:)
      method_name = "#{method}_serializer"
      respond_to?(method_name, true) ? send(method_name) : presenter
    end

    protected def form_for(method_action:)
      method_name = "#{method}_presenter"
      respond_to?(method_name, true) ? send(method_name) : presenter
    end

    protected def safe_params_for(method_action:)
      method_name = "#{method}_safe_params"
      respond_to?(method_name, true) ? send(method_name) : safe_params
    end
  end
end
