class ConsolesController < ApplicationController
  def index
    @consoles = Console.all
  end

  def new
    @console = Console.new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
