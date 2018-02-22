class OmniauthCallbacksController < ApplicationController
  skip_before_action :render_layout

  def callback
    binding.pry
    redirect_to '/?auth=success'
  end

  def starladder
    binding.pry
  end
end
