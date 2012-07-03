class Api::DreamsController < Api::ApiController
  def index
    dreams = Dream.all
    respond_with(dreams)
  end

  def create
    dream = Dream.create(params[:dream])
    respond_with(dream, location: api_dreams_path)
  end

  def update
    dream = Dream.find(params[:id])
    dream.update_attributes(params[:dream])
    respond_with(dream)
  end

  def destroy
    dream = Dream.find(params[:id])
    dream.destroy
    respond_with(dream)
  end
end
