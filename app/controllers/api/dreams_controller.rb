class Api::DreamsController < InheritedResources::Base
  respond_to :json
  actions :index, :create, :update, :destroy
end
