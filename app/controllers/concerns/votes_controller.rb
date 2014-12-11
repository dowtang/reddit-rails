class VotesController < ApplicationController
  def index
    @votes = Vote.all
    harry = "harry"

  end
end