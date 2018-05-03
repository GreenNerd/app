module Miniprogram::Controllers::Project
  # Api for get one project
  class Show
    include Miniprogram::Action
    DISPLAY_NUM = 7
    
    expose :project, :user, :time_tables

    def call(params)
      @project = ProjectRepository.new.find(params[:id].to_i)
      halt 404 unless project
      @time_tables = DayTableRepository.new(project.id).get_tables(DISPLAY_NUM)
    end
  end
end

