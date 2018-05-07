module Miniprogram::Views::Reservation
  class Index
    include Miniprogram::View
      format :json

      def render
        raw ({
          reservations: transformed_reservations
        }.to_json)
      end

      private

      def transformed_reservations
        project_repository = ProjectRepository.new
        reservation_ids = reservations.map { |item| item.reservation_id }
        projects = project_repository.get_projects_from_reservations(*reservation_ids)
  
        i = 0
        reservations.map do |reservation|
          project = projects[i]
          i += 1
          {
            id:           reservation.reservation_id,
            state:        reservation.state,
            project_id:   project.id,
            project_name: project.name,
            project_state: project.state,
            address:      project.address || '',
            latitude:     project.latitude || '',
            longitude:    project.longitude || '',
            share_code:   '',
            date:         reservation.date,
            time:         reservation.time,
            name:         reservation.name,
            tel:          reservation.tel,
            remark:       reservation.remark
          }
        end
      end
  end
end
