class StaticController < ApplicationController
  skip_verify_authorized

  def home
  end
end
